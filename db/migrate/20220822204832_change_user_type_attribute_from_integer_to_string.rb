# frozen_string_literal: true

class ChangeUserTypeAttributeFromIntegerToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :type, :string, null: false
  end
end
