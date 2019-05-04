class Api::Deposit::ShipmentPolicy
  attr_reader :user, :shipment

  def initialize(user, shipment)
    @user = user
    @shipment = shipment
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