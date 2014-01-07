class RemoveCostCurrencyFromCourseEventCandidate < ActiveRecord::Migration
  def change
    remove_column :course_event_candidates, :cost_currency, :integer
  end
end
