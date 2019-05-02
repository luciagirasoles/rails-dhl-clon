class RemoveDestinationCityFromShipments < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipments, :destination_city, :string
  end
end
