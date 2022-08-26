# frozen_string_literal: true

module Api
  module V1
    module Bulk
      class TransactionsController < BaseController
        def create
          created_transactions = transaction_params.map do |transaction_param|
            transaction = transaction_class(transaction_param[:type]).new(transaction_param)
            transaction if transaction.save
          end
          render json: created_transactions, status: :ok
        end

        def transaction_class(transaction_type)
          transaction_type.safe_constantize
        end

        private

        def transaction_params
          params.permit(transactions: %i[amount status type customer_email customer_phone
                                         merchant_id]).require(:transactions)
        end
      end
    end
  end
end
