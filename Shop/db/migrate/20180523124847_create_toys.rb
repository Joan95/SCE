class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.integer :numberPieces
      t.string :description
      t.float :price
      t.string :image
      t.string :ageRange
      t.string :topic
      t.timestamps
    end
  end
end
