class CreateCourseEvents < ActiveRecord::Migration
  def change
    create_table :course_events do |t|
      t.integer :course_master_id, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false

      t.timestamps
    end
  end
end
