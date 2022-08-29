# frozen_string_literal: true

class Transaction < ApplicationRecord

  enum :status, %i[approved reversed refunded error]

  belongs_to :merchant

  validates :type, presence: true
  validates :customer_email, presence: true, email: true
end
