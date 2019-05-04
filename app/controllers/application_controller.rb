class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :authentication, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authentication
    unless current_user
      flash[:notice] = "You must login to access to this page or to do this action"
      redirect_to user_session_path
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :country, :city, :address])
  end

  def after_sign_in_path_for(current_user)
    if current_user.role == "admin"
      return admin_path
    elsif current_user.role == "deposit" 
      return deposit_index_path
    else
      return root_path
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def after_sign_in_path_for(current_user)
    if current_user.role == 'admin'
      admin_shipments_path
    elsif current_user.role == 'deposit'
      deposit_shipment_index_path
    else
      regular_shipments_path
    end
  end
end
