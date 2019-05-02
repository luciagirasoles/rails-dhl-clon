class AddLocationsToShipment < ActiveRecord::Migration[5.2]
  def change
    add_column :shipments, :origin_city, :string
    add_column :shipments, :origin_country, :string
    add_column :shipments, :destination_city, :string
    add_column :shipments, :destination_country, :string
  end
end
