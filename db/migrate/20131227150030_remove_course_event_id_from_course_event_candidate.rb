class RemoveCourseEventIdFromCourseEventCandidate < ActiveRecord::Migration
  def change
    remove_column :course_event_candidates, :course_event_id, :integer
  end
end
