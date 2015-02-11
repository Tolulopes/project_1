class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.role == 'user'
      producers_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :role << :image
  end

#  before_action :configure_permitted_parameters, if: :devise_controller?
# protected

# def configure_permitted_parameters
#   devise_parameter_sanitizer.for(:sign_up) << :username
# end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
end
