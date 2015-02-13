class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :delete, :destroy, to: :modify
    # can :modify, Comment
  
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        # can :assign_roles, User 
        # can [:new, :create, :edit, :update, :destroy], [Producer, Comment]
      # elsif user.producer?
      #   # can :manage, :all
      #   can :read, :all
      #   can :all, Track, user_id: user.id
      #   # can do some stuff
      else
        can :read, :all
        can [:new, :create, :delete], [Comment, Track]
      end
    
      can [:modify], Track, user_id: user.id

      

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
