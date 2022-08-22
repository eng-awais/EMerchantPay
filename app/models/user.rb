# frozen_string_literal: true

class User < ApplicationRecord

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
  validates :type, presence: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

end
