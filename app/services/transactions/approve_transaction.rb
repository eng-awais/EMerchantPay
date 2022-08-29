# frozen_string_literal: true

module Transaction
  class ApproveTransaction

    include Interactor::Organizer
    orgainze :update_transaction_status

    organize do
      add :update_merchant_amount, unless :refund_transaction?
      add :update_customer_amount, if :refund_transaction?
    end

    private

    def refund_transaction?
      params[:type] == 'refund'
    end

  end
end
