class AddInstructorIdToCourseEvent < ActiveRecord::Migration
  def change
    add_column :course_events, :instructor_id, :integer
  end
end
