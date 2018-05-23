class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packs_toys do |t|
      t.belongs_to :toy, index: true
      t.belongs_to :pack, index: true
    end
  end
end
