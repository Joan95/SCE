class CreatePacks < ActiveRecord::Migration[5.1]
  def change
    create_table :packs do |t|
      t.string :name
      t.float :price
      t.string :image
      t.string :description
      t.string :ageRange
      t.string :discount
      t.timestamps
    end
  end
end
