# frozen_string_literal: true

class Merchant < ApplicationRecord

  enum :status, { active: 0, inactive: 1 }

  belongs_to :user

  has_many :transactions
  has_many :authorize_transactions
  has_many :charge_transactions
  has_many :refund_transactions
  has_many :reverse_transactions

  validates :status, presence: true

end
