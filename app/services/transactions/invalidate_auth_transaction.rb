# frozen_string_literal: true

module Transaction
  class InvalidateAuthTransaction

    def call
      transaction = AuthorizeTransaction.find_by(id: params[:auth_id])
      if transaction.update(status: 'reversed')
        context.transaction = transaction
      else
        context.fail!
      end
    end

  end
end
