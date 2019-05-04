class Api::Deposit::ShipmentPolicy
  attr_reader :user, :shipment

  def initialize(user, shipment)
    @user = user
    @shipment = shipment
  end

  def index?
    user && user.role?('deposit')
  end

  def show
    user && user.role?('deposit')
  end

  def search
    user && user.role?('deposit')
  end

  def check_in
    user && user.role?('deposit')
  end
  
  def record_not_found
    user && user.role?('deposit')
  end
end