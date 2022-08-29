# frozen_string_literal: true

module Transaction
  class UpdateTransactionStatus
    include Interactor

    def call
      transaction = transaction_class(params[:type]).find_by(params[:id])

      if(transaction.update(status: params[:status]))
        context.transaction = transaction
      else
        transaction.update!(status: 'error')
        context.fail!
      end
    end

    private

    def transaction_class(type)
      (type + 'Transaction').safe_constantize
    end
  end
end
