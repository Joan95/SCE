class CreateAssemblies < ActiveRecord::Migration[5.1]
  def change
    create_table :assemblies, id: false do |t|
      t.belongs_to :piece, index: true
      t.belongs_to :toy, index: true
      t.timestamps
    end
  end
end
