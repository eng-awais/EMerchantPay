# frozen_string_literal: true

class MergeFirstAndLastNameFieldsToName < ActiveRecord::Migration[7.0]
  def change
    remove_column :merchants, :first_name, :string, default: ''
    remove_column :merchants, :last_name, :string, default: ''
    add_column :merchants, :name, :string, default: ''
  end
end
