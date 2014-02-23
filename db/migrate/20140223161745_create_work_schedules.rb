class CreateWorkSchedules < ActiveRecord::Migration
  def change
    create_table :work_schedules do |t|
      t.string :task_work
      t.integer :duration
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
