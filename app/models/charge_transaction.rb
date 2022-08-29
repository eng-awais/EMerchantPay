# frozen_string_literal: true

class ChargeTransaction < Transaction

  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }

end
