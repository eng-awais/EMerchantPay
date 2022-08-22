# frozen_string_literal: true

class Merchant < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :restrict_with_exception
  has_many :authorize_transactions
  has_many :charge_transactions
  has_many :refund_transactions
  has_many :reverse_transactions

  validates :status, presence: true

  enum :status, { active: 0, inactive: 1 }

  def delete
    self.destroy
  end
end
