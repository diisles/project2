class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_posts_path(current_user)
  end

  # def after_update_path_for(resource)
  #   user_posts_path(current_user)
  # end
 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :img, :school, :tel])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :img, :school, :tel])
 end

 def after_update_path_for(resource)
   user_posts_path(current_user)
 end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
