# frozen_string_literal: true

module Transaction
  class UpdateMerchantAmount
    include Interactor

    before :set_merchant, :total_amount

    def call
      if merchant.save!
        context.merchant = merchant
      else
        context.fail!(message: 'unable to update merchant transaction sum')
      end
    end

    private

    def set_merchant
      @merchant = Merchant.find_by(id: params[:merchant_id])
    end

    def total_amount
      if (params[:type]) == 'charge'
        merchant.total_transaction_sum += params[:amount].to_f
      else
        merchant.total_transaction_sum -= params[:amount].to_f
      end
    end
  end
end
