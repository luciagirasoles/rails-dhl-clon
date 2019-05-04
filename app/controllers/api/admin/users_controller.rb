class Api::Admin::UsersController < ApiController
  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, notice: "The User was successfully created"
    else
      render json: {error: "Error create users"}, status: :not_found
    end
  end

  def edit
    @user = User.find_by(params[:id])
    render json: @user
  end
  
  def update
    @user = User.find(params[:id])
    if  @user.update(role: user_params[:role])
      render json: @user
    else
      render json: {error: "Error update users"}
    end
  end

  def search
    if params[:id]
      @user = User.find(params[:id])
        if @user
          render json: @user
        else
          render json: {error: "It doesn't exists a shipment with that tracking id"}, status: 404
        end
    else
      render json: {error: "You have to pass the argument 'id'"}, status: 400
    end
  end

  # def edit_search
  # #view exist
  # end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :city, :country, :address, :role)
  end
  def search_user_param
    params.permit(:search_parameters, :utf8, :search_by)
  end
end
