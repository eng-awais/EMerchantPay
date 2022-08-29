class TransactionPresenter < ApplicationPresenter

  def self.index_page_title(merchant)
    "Merchant #{merchant.email} Transactions"
  end

end
