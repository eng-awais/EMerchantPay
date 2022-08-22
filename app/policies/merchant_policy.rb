class MerchantPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || (user.merchant? && record.user == user)
  end

  def edit?
    update?
  end

  def update?
    user.merchant? && record.user == user
  end

  def destroy?
    user.admin?
  end
end
