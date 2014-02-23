class CreateSiteVisits < ActiveRecord::Migration
  def change
    create_table :site_visits do |t|
      t.string :work_completed
      t.date :visit_date
      t.integer :customer_id

      t.timestamps
    end
  end
end
