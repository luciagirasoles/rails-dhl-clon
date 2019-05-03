class Admin::UsersController < ApplicationController
  def new
    #/admin/users/new(.:format)
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end
  
  def update
  end
  
  def search 
  end

  def edit_search
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :city, :country, :address, :role)
  end

end

# create_table "users", force: :cascade do |t|
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.string "username"
#     t.string "city"
#     t.string "country"
#     t.string "address"
#     t.string "role", default: "regular"