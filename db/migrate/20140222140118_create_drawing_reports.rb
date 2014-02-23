class CreateDrawingReports < ActiveRecord::Migration
  def change
    create_table :drawing_reports do |t|
      t.integer :revision_no
      t.string :list_of_drawing
      t.string :issue_drawing
      t.boolean :copy
      t.date :date_completed

      t.timestamps
    end
  end
end
