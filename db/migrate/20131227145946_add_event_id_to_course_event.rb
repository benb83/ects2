class AddEventIdToCourseEvent < ActiveRecord::Migration
  def change
    add_column :course_events, :event_id, :integer
  end
end
