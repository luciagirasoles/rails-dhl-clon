class RegularPolicy < ApplicationPolicy
  attr_reader :user, :regular

  def initialize (user, regular)
    @user = user
    @regular = regular
  end  

  def index?
    user.role?(regular)
  end

  def search?
    user.role?(regular)
  end
end