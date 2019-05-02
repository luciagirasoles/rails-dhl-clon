class RemoveOriginCountryFromShipments < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipments, :origin_country, :string
  end
end
