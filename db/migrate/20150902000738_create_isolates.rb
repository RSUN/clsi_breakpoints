class CreateIsolates < ActiveRecord::Migration
  def change
    create_table :isolates do |t|
      t.integer :isolate_id
      t.integer :collection
      t.integer :site
      t.integer :study_year
      t.integer :bank
      t.string :organism_code

      t.timestamps null: false
    end
  end
end
