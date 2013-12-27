class RemoveEventIdFromCourseEvent < ActiveRecord::Migration
  def change
    remove_column :course_events, :event_id, :integer
  end
end
