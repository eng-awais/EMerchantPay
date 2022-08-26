# frozen_string_literal: true

class AddEmailAndPasswordFieldToMerchant < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :email, :string, null: false, default: ''
    add_column :merchants, :encrypted_password, :string, null: false, default: ''
    add_index :merchants, :email, unique: true
  end
end
