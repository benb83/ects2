class CreateCourseMasters < ActiveRecord::Migration
  def change
    create_table :course_masters do |t|
      t.string :code, :null => false, limit: 8
      t.string :title, :null => false, limit: 80
      t.float :duration, :default => 1
      t.integer :min_candidate, :default => 3
      t.integer :max_candidate, :default => 8

      t.timestamps
    end
  end
end
