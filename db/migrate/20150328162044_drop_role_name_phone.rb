class DropRoleNamePhone < ActiveRecord::Migration
  def change
  	remove_column :users, :role, :integer
  	remove_column :users, :name, :string
    remove_column :users, :phone, :integer
  end
end
