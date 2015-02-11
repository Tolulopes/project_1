class UsersController < ApplicationController

  before_action :authenticate_user!
  authorize_resource

  def index
    @users = User.all
  end  

  def update
    # authorize! :assign_roles, @user if params[:user][:assign_roles]
  end

  def edit
    @user = User.find(params[:id])
    # render 'users/registrations/edit'
  end

  def show 
    @user = User.find(params[:id])
  end

end
