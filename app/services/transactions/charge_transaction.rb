# frozen_string_literal: true

module Transaction
  class ChargeTrnsaction
    include Interactor::Organizer
    organize UpdateCustomerAmount, CreateTransaction

  end

end
