class RemovePersonCandidateIdFromCourseEventCandidate < ActiveRecord::Migration
  def change
    remove_column :course_event_candidates, :person_candidate_id, :integer
  end
end
