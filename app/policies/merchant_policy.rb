# frozen_string_literal: true

class MerchantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin_user?
        scope.all
      elsif user.merchant_user?
        scope.where(merchant_user_id: user.id)
      else
        false
      end
    end
  end

  def show?
    user.admin_user? || (user.merchant_user? && record.merchant_user == user)
  end

  def edit?
    update?
  end

  def update?
    user.admin_user?
  end

  def destroy?
    update?
  end
end
