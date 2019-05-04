class Api::Admin:ShipmentPolicy
  attr_reader :user, :shipment

  def initialize(user, shipment)
    @user = user
    @shipment = shipment
  end

  def index?
    user && (user.role?('admin') || user.role?('sales')) 
  end
  
  def show?
    user && (user.role?('admin') || user.role?('sales'))
  end

  def search?
    user && (user.role?('admin') || user.role?('sales'))
  end

  def top_senders_by_freight_value?
    user && (user.role?('admin') || user.role?('sales'))
  end

  def top_senders_by_packages_sent?
    user && (user.role?('admin') || user.role?('sales'))
  end

  def top_5_countries_senders?
    user && (user.role?('admin') || user.role?('sales'))
  end

  def top_5_countries_recipients?
    user && (user.role?('admin') || user.role?('sales'))
  end
   
end