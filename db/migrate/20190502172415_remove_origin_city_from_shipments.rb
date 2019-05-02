class RemoveOriginCityFromShipments < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipments, :origin_city, :string
  end
end
