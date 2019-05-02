class AddRecipientToShipments < ActiveRecord::Migration[5.2]
  def change
    add_reference :shipments, :recipient, foreign_key: { to_table: :users }
  end
end
