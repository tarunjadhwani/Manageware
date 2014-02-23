class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :area
      t.string :payment_type
      t.integer :amount

      t.timestamps
    end
  end
end
