class UsersController < ApplicationController
  load_and_authorize_resource
  def update
    authorize! :assign_roles, @user if params[:user][:assign_roles]
  end

  def index
    @users = User.all
    puts @users
  end  

end
