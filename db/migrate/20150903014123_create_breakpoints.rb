class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.string :drug
      t.integer :s_maximum
      t.integer :r_minimum
      t.string :surrogate_drugs
      t.string :r_if_surrogate_is
      t.string :ni_if_surrogate_is
      t.string :r_if_blt_is
      t.string :delivery_mechanism
      t.string :infection_type
      t.string :footnote
      t.string :master_group_include
      t.string :organism_group_include
      t.string :viridans_group_include
      t.string :genus_include
      t.string :genus_exclude
      t.string :organism_code_include
      t.string :organism_code_exclude
      t.string :gram_include
      t.string :level_1_include
      t.string :level_3_include
      t.string :level_3_exclude

      t.timestamps null: false
    end
  end
end
