class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :update_date, :destroy]

  def final_form
    @resource = current_user
  end

  def update_data
    self.resource = resource_class.to_adapter.get!(current_user.to_key)
    resource_updated = update_resource(resource, user_params)
    redirect_to after_sign_in_path_for(current_user)
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :city, :country, :address)
  end
end