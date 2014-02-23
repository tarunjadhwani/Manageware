class AddColumnToWorkOrdersCustomerId < ActiveRecord::Migration
	def change
		add_column :work_orders, :customer_id, :integer
	end
end
