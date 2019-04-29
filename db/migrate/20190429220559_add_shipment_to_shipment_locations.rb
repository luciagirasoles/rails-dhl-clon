class AddShipmentToShipmentLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :shipment_locations, :shipment, foreign_key: true
  end
end
