class AddMasterIdToCourseEvent < ActiveRecord::Migration
  def change
    add_column :course_events, :master_id, :integer
  end
end
