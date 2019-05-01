class AddSenderToShipments < ActiveRecord::Migration[5.2]
  def change
    add_reference :shipments, :sender, foreign_key: true
  end
end
