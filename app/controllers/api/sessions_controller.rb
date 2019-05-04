class Api::SessionsController < ApiController
  skip_before_action :require_login, only: :create

  def create
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      # user.access_token
      render json: { token: user.authentication_token }
    else
      render json: {errors: 'Incorrect email or password'}, status: :Unauthorized
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end