class MerchantPresenter < ApplicationPresenter

  def email
    @model.user.email
  end

end
