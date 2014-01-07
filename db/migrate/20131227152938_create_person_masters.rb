class CreatePersonMasters < ActiveRecord::Migration
  def change
    create_table :person_masters do |t|
      t.string :family_name, limit: 35
      t.string :given_name, limit: 35
      t.string :other_names, limit: 35
      t.string :sex, limit: 1
      t.date :dob

      t.timestamps
    end
  end
end
