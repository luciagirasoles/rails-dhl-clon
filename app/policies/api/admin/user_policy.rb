class Api::Admin::AdminPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @user = user
    @current_user = current_user
  end

  def create?
    current_user && current_user.role?('admin')
  end

  def edit?
    current_user && current_user.role?('admin')
  end
  
  def update
    current_user && current_user.role?('admin')
  end

  def search
    current_user && current_user.role?('admin')
  end
end