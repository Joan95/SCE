class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :numberPieces
      t.string :gender
      t.string :price
      t.string :bio
      t.string :image
      t.references :piece, index: true
      t.timestamps
    end
  end
end
