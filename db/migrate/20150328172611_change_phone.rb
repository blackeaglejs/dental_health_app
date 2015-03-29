class ChangePhone < ActiveRecord::Migration
  def change
  	change_column :profiles, :phone, :text
  end
end
