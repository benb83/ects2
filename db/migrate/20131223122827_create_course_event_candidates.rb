class CreateCourseEventCandidates < ActiveRecord::Migration
  def change
    create_table :course_event_candidates do |t|
      t.integer :course_event_id, :null => false
      t.integer :person_candidate_id, :null => false

      t.timestamps
    end
  end
end
