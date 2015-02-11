class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!

  def update
    authorize! :assign_roles, @user if params[:user][:assign_roles]
  end

  def edit
    @user = User.find(params[:id])
    render 'users/registrations/edit'
  end



  def index
    @users = User.all
    puts @users
  end  

end
