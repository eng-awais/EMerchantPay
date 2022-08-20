# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.float :amount, null: false
      t.integer :status, null: false
      t.string :type, null: false
      t.string :customer_email, default: ''
      t.string :customer_phone, default: ''
      t.belongs_to :merchant, type: :uuid

      t.timestamps
    end
  end
end
