class AddCostCurrencyIdToCourseEventCandidate < ActiveRecord::Migration
  def change
    add_column :course_event_candidates, :cost_currency_id, :integer
  end
end
