class RemoveRequiredConstraintOfAmountInTransaction < ActiveRecord::Migration[7.0]
  def change
    change_column_null :transactions, :amount, true
    change_column_null :transactions, :status, true
  end
end
