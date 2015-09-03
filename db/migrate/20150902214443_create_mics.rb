class CreateMics < ActiveRecord::Migration
  def change
    create_table :mics do |t|
      t.references :isolate, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true
      t.float :value
      t.integer :edge

      t.timestamps null: false
    end
  end
end
