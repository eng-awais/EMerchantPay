# frozen_string_literal: true

class User < ApplicationRecord
  has_one :merchant, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum :role, { admin: 0, merchant: 1 }
end
