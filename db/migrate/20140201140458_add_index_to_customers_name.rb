class AddIndexToCustomersName < ActiveRecord::Migration
  def change
  	add_index :customers, :name, unique: true
  end
end
