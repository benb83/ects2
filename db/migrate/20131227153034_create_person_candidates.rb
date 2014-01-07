class CreatePersonCandidates < ActiveRecord::Migration
  def change
    create_table :person_candidates do |t|
      t.integer :master_id

      t.timestamps
    end
  end
end
