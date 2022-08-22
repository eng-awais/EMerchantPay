# frozen_string_literal: true

class AddTypeInUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :type, :integer, null: false
    remove_column :users, :role, :integer, null: false
  end

  def down
    remove_column :users, :type, :integer, null: false
    add_column :users, :role, :integer, null: false
  end
end
