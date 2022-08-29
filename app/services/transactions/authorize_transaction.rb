# frozen_string_literal: true

module Transaction
  class AuthorizeTransaction

    def call
      transaction = AuthorizeTransaction.new(amount: params[:amount], customer_email: params[:customer_email],
                                             customer_phone: params[:customer_phone])
      if transaction.save
        context.transaction = transaction
      else
        context.fail!
      end
    end
  end
end
