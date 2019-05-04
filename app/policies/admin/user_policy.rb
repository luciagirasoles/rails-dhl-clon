class Admin::UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @user = user
    @current_user = current_user
  end

  def new?
    current_user && current_user.role?('admin')
  end

  def create?
    current_user && current_user.role?('admin')
  end

  def edit?
    current_user && current_user.role?('admin')
  end

  def update?
    current_user && current_user.role?('admin')
  end

  def search_user?
    current_user && current_user.role?('admin')
  end

  def edit_search_admin_users_path?
    current_user && current_user.role?('admin')
  end
end