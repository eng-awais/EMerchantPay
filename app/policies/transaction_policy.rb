class TransactionPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || is_merchant?
  end

  def is_merchant?
    user.merchant? && record.merchant == user.merchant
  end
end
