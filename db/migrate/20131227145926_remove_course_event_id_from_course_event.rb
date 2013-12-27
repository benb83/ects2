class RemoveCourseEventIdFromCourseEvent < ActiveRecord::Migration
  def change
    remove_column :course_events, :course_event_id, :integer
  end
end
