class AddCustomerIdToWorkSchedule < ActiveRecord::Migration
  def change
  	add_column :work_schedules, :customer_id, :integer
  end
end
