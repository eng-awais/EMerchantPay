# frozen_string_literal: true

module Transaction
  class UpdateCustomerAmount
    include Interactor

    attr_reader :merchant, :auth_transaction

    before :set_merchant, :get_authorize_transaction

    def call
      if params[:type] == 'charge' && auth_transaction.amount > params[:amount].to_f && merchant.active?
        if auth_transaction.update(amount: auth_transaction.amount - params[:amount].to_f)
          context.auth_transaction = auth_transaction
        else
          auth_transaction.update(status: 'error')
          context.fail!
        end
      else
        auth_transaction.update(amount: auth_transaction.amount + params[:amount].to_f)
        context.auth_transaction = auth_transaction
      end
    end

    def rollback
      if params[:type] == 'charge'
        context.auth_transaction.update!(amount: auth_transaction.amount - params[:amount].to_f)
      else
        context.auth_transaction.update!(amount: auth_transaction.amount + params[:amount].to_f)
      end
    end

    private

    def set_merchant
      @merchant = Merchant.find_by(id: params[:merchant_id])
    end

    def get_authorize_transaction
      @auth_transaction = AuthorizeTransaction.find_by(email: params[:customer_email])
    end
  end
end
