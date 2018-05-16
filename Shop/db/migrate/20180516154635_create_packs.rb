class CreatePacks < ActiveRecord::Migration[5.1]
  def change
    create_table :packs do |t|
      t.string :price
      t.string :image
      t.references :toy, index: true
      t.timestamps
    end
  end
end
