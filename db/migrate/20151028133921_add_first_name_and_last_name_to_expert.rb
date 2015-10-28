class AddFirstNameAndLastNameToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :first_name, :string
    add_column :experts, :last_name, :string
  end
end
