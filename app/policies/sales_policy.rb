class SalesPolicy < ApplicationPolicy

  attr_reader :user, :sales

  def initialize (user, sales)
    @user = user
    @sales = sales
  end
  

  def index?
    user.admin? || user.sales?
  end
  
end
