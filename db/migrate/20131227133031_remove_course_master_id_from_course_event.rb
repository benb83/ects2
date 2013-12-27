class RemoveCourseMasterIdFromCourseEvent < ActiveRecord::Migration
  def change
    remove_column :course_events, :course_master_id, :integer
  end
end
