class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :shipping_cost
      t.integer :payment_method, null: false, defaoult: 0
      t.string :zip_code
      t.string :address
      t.string :order_name
      t.integer :total_amount
      t.integer :order_status

      t.timestamps
    end
  end
end
