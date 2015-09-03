class CreateOrganisms < ActiveRecord::Migration
  def change
    create_table :organisms do |t|
      t.string :code
      t.string :name
      t.string :species
      t.string :sub_species
      t.string :organism_group
      t.string :master_group
      t.string :viridans_group
      t.string :level1
      t.string :level2
      t.string :level3
      t.string :level4

      t.timestamps null: false
    end
  end
end
