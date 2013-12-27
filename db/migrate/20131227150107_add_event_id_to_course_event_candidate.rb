class AddEventIdToCourseEventCandidate < ActiveRecord::Migration
  def change
    add_column :course_event_candidates, :event_id, :integer
  end
end
