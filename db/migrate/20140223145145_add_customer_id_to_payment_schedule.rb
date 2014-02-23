class AddCustomerIdToPaymentSchedule < ActiveRecord::Migration
  def change
  	add_column :payment_schedules, :customer_id, :integer
  end
end
