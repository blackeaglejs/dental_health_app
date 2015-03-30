class ChangeDob < ActiveRecord::Migration
  def change
  	remove_column :children, :dob, :date
  	add_column :children, :birth_year, :integer
  	add_column :children, :birth_month, :integer
  	add_column :children, :birth_date, :integer
  end
end
