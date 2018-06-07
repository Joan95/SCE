class CreateNewUserFields < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :first_name, :string
	add_column :users, :last_name, :string
	add_column :users, :address, :string
	add_column :users, :mobile, :string
	add_reference :users, :orders, index: true
  end
end
