class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  
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

<<<<<<< HEAD
  def after_sign_in_path_for(current_user)
    if current_user.role == 'admin'
      admin_shipments_path
    elsif current_user.role == 'deposit'
      deposit_shipment_index_path
    else
      regular_shipments_path
    end
  end
=======
  # def include_api
  #   if params[:controller].include?("api")
  #     acts_as_token_authentication_handler_for User
  #   end
  # end
>>>>>>> 00df3e01231d430191a7e3f61086d788bbbc1c30
end
