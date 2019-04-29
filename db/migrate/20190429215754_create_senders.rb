class CreateSenders < ActiveRecord::Migration[5.2]
  def change
    create_table :senders do |t|
      t.string :store_name
      t.string :order_id
      t.string :integer
      t.string :email
      t.string :integer

      t.timestamps
    end
  end
end
