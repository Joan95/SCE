class CreatePieces < ActiveRecord::Migration[5.1]
  def change
    create_table :pieces do |t|
      t.string :description
      t.string :price
      t.string :image
      t.timestamps
    end
  end
end