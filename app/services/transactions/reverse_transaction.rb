# frozen_string_literal: true

module Transaction
  class ReverseTransaction
    include Interactor::Organizer
    organize :create_transaction, :invalidate_auth_transaction

  end
end
