class AddCostToCourseEventCandidate < ActiveRecord::Migration
  def change
    add_column :course_event_candidates, :cost, :float
  end
end
