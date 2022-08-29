# frozen_string_literal: true

module Transaction
  class RefundTransaction
    include Interactor::Organizer
    organize :create_transaction, :invalidate_auth_transaction

  end
end
