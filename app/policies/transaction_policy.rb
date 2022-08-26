# frozen_string_literal: true

class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(current_user, model, record)
      @user = current_user
      @scope = model
      @record = record
    end

    def resolve
      if user.admin_user?
        scope.where(merchant: record)
      elsif user.merchant_user? && user.id == record.merchant_user_id
        scope.where(merchant: record)
      else
        false
      end
    end

    attr_reader :user, :scope, :record
  end
end
