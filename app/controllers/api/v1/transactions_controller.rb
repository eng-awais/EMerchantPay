# frozen_string_literal: true
module Api
  module V1
    class TransactionsController < BaseController
      def create
        @transaction = transaction_class.new(transaction_params)
        if @transaction.save
          render json: @transaction, status: :ok
        else
          render json: { errors: @transaction.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def transaction_class
        transaction_params[:type].safe_constantize
      end

      private

      def transaction_params
        params.require(:transaction).permit(:amount, :status, :type, :customer_email, :customer_phone, :merchant_id)
      end
    end
  end
end
