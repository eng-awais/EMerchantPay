class TransactionSerializer < ApplicationSerializer
  attributes :amount, :status, :type, :customer_email, :customer_phone, :merchant_id
end
