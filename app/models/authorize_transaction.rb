# frozen_string_literal: true

class AuthorizeTransaction < Transaction

  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }
end
