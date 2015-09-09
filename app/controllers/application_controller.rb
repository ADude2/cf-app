class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized
    flash[:alert] = "You must sign up or login first."
    redirect_to (request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
  end
end
