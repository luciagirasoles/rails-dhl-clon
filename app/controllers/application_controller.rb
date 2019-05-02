class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :include_api

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

  def after_sign_in_path_for(current_user)
    if current_user.role == 'admin'
      admin_shipments_path
    elsif current_user.role == 'deposit'
      deposit_shipment_index_path
    else
<<<<<<< HEAD
      regular_shipment_path
=======
      regular_shipments_path
>>>>>>> d340b849a345f0ed46c22c8cd6fbc4388364352a
    end
  end

  # def include_api
  #   if params[:controller].include?("api")
  #     acts_as_token_authentication_handler_for User
  #   end
  # end
end
