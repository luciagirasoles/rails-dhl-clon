class ShipmentsPolicy < ApplicationPolicy

  attr_reader :user, :sales

  def initialize (user, sales)
    @user = user
    @sales = sales
  end
  

  def index?
    user.role?(admin) || user.role?(sales)
  end

  def new?
    user.role?(admin) || user.role?(sales)
  end
  
end
