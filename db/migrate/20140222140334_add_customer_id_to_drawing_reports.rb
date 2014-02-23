class AddCustomerIdToDrawingReports < ActiveRecord::Migration
  def change
  	add_column :drawing_reports, :customer_id, :integer
  end
end
