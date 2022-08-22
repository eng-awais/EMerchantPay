# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum :status, { approved: 0, reversed: 1, refunded: 2, error: 3 }

  belongs_to :merchant

  validates :amount, presence: true , numericality: true, comparison: { greater_than: 0 }
  validates :type, :status, presence: true

end
