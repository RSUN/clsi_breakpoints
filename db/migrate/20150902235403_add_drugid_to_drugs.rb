class AddDrugidToDrugs < ActiveRecord::Migration
  def change
    add_column :drugs, :drugid, :integer
  end
end
