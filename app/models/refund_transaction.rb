# frozen_string_literal: true

class RefundTransaction < Transaction

  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }

end
