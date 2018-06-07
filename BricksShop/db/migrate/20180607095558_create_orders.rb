class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :order_status_products, index: true
      t.float :totalPrice
      t.timestamps
    end
  end
end
