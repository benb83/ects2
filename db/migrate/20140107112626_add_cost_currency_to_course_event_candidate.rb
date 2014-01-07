class AddCostCurrencyToCourseEventCandidate < ActiveRecord::Migration
  def change
    add_column :course_event_candidates, :cost_currency, :integer
  end
end
