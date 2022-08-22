class MergeFirstAndLastNameFieldsToName < ActiveRecord::Migration[7.0]
  def up
    remove_column :merchants, :first_name, :string, default: ''
    remove_column :merchants, :last_name, :string, default: ''
    add_column :merchants, :name, :string, default: ''
  end

  def down
    add_column :merchants, :first_name, :string, default: ''
    add_column :merchants, :last_name, :string, default: ''
    remove_column :merchants, :name, :string, default: ''
  end
end
