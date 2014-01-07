class CreatePersonInstructors < ActiveRecord::Migration
  def change
    create_table :person_instructors do |t|
      t.integer :master_id

      t.timestamps
    end
  end
end
