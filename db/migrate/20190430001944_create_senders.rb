class CreateSenders < ActiveRecord::Migration[5.2]
  def change
    create_table :senders do |t|
      t.string :store_name
      t.integer :order_id
      t.string :email

      t.timestamps
    end
  end
end
