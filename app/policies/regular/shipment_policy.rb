class Regular::ShipmentPolicy
  attr_reader :user, :shipment

  def initialize(user, shipment)
    @user = user
    @shipment = shipment
  end

  def index?
    user && user.role?('regular')
  end
  def index
    user && user.role?('regular')
  end
  
  def show
    user && user.role?('regular')
  end

  def search
    user && user.role?('regular')
  end
  
end