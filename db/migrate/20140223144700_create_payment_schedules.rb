class CreatePaymentSchedules < ActiveRecord::Migration
  def change
    create_table :payment_schedules do |t|
      t.string :status
      t.integer :amount
      t.date :payment_date

      t.timestamps
    end
  end
end
