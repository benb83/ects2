class AddCandidateIdToCourseEventCandidate < ActiveRecord::Migration
  def change
    add_column :course_event_candidates, :candidate_id, :integer
  end
end
