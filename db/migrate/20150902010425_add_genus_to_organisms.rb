class AddGenusToOrganisms < ActiveRecord::Migration
  def change
    add_column :organisms, :genus, :string
  end
end
