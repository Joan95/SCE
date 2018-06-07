class CreateOrderStatusProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_status_products do |t|
      t.string :status
      t.references :order, index: true
      t.references :items, index: true
      t.timestamps
    end
  end
end
