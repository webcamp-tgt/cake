class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :price_tax
      t.integer :order_quantity
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
