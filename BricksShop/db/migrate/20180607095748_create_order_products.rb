class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :items, index: true
      t.timestamps
    end
  end
end
