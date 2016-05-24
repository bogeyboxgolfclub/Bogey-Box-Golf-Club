class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, ActionController::MethodNotAllowed, ActionController::ExceptionCaught do |exception|
      redirect_to :root
    end
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:stripe_card_token, :email, :password, :first_name, :last_name, :phone, :password_confirmation, :zip_code)
    end

  	devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:stripe_card_token, :first_name, :last_name, :phone, :password_confirmation, :email, :zip_code)
    end
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'Please Sign In'
    end
  end

end
