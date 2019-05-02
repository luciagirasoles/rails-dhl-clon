class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :include_api

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :country, :city, :address])
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def include_api
    if params[:controller].include?("api")
      acts_as_token_authentication_handler_for User
    end
  end
end
