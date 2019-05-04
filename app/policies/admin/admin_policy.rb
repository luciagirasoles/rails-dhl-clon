class Admin::AdminPolicy
  attr_reader :user, :admin

  def initialize(user, admin)
    @user = user
    @admin = admin
  end

  def index?
    user && user.role?('admin')
  end

  def show?
    user && user.role?('admin')
  end

  def create?
    user && user.role?('admin')
  end

  def new?
    user && user.role?('admin')
  end

  def update?
    user && user.role?('admin')
  end

  def edit?
    user && user.role?('admin')
  end

  def destroy?
    user && user.role?('admin')
  end
  
  def metrics?
    user && user.role?('admin')
  end
end
