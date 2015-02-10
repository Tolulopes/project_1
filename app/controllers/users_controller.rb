class UsersController < ApplicationController

  def update
    authorize! :assign_roles, @user if params[:user][:assign_roles]
  end


end
