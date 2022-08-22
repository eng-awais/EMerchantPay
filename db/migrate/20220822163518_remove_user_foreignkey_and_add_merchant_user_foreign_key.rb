# frozen_string_literal: true

class RemoveUserForeignkeyAndAddMerchantUserForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_index :merchants, :user_id
    remove_column :merchants, :user_id, :uuid
    add_reference :merchants, :merchant_user, type: :uuid, index: true
  end
end
