class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :tracking_id
      t.string :origin_address
      t.string :destination_address
      t.integer :weight
      t.datetime :reception_date
      t.datetime :estimated_delivery_date
      t.datetime :delivered_date
      t.integer :freight_value

      t.timestamps
    end
  end
end
