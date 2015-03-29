class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :name
    	t.integer :role
    	t.integer :phone
    	t.references :user, index: true
    end
  end
end
