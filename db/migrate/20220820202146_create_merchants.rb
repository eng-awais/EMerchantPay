# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants, id: :uuid do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.text :description, default: ''
      t.integer :status, null: false
      t.float :total_transaction_sum, default: 0.0
      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end
