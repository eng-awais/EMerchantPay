# frozen_string_literal: true

module Transaction
  class CreateTransaction
    include Interactor

    def call
      transaction = transaction_class(type).create(merchant_id: params[:merchant_id],
                                                   customer_email: params[:customer_email], amount: params[:amount])

      if transaction.persisted?
        context.transaction = transaction
      else
        context.fail!
      end
    end

    def rollback
      context.transaction.destroy
    end

    private

    def transaction_class(type)
      (type + 'Transaction').safe_constantize
    end

  end
end
