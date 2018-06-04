class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description
      t.string :category
      t.timestamps
    end
  end
end
