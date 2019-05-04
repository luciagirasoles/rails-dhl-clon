class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
    authorize [:admin,  @user]
  end

  def create
    @user = User.new(user_params)
    authorize [:admin,  @user]
    if @user.save
      redirect_to admin_shipments_path(@user), notice: "The User was successfully created"
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
    authorize [:admin,  @user]
  end
  
  def update
    @user = User.find(params[:id])
    authorize [:admin,  @user]
    if @user.update(role: user_params[:role])
      redirect_to edit_search_admin_users_path, notice: "The user was successfully updated"
    else
      render :edit
    end
  end

  def search_user
    authorize [:admin,  @user]
    @user=User.search(search_user_param[:search_by],search_user_param[:search_parameters])

    if @user
      redirect_to edit_admin_user_path(@user.id)
    else
      redirect_to edit_search_admin_users_path, notice: "User not found. Please, try again"
    end  
  end

  def edit_search
    authorize [:admin,  @user]
  #view exist
  end

  def authorize_admin
    authorize User, :new?, policy_class: AdminPolicy
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :city, :country, :address, :role)
  end
  def search_user_param
    params.permit(:search_parameters, :utf8, :search_by)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
