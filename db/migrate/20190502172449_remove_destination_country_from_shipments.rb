class RemoveDestinationCountryFromShipments < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipments, :destination_country, :string
  end
end
