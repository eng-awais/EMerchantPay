class RemoveTransactionsWorker
  include Sidekiq::Worker
  sidekiq_options unique_across_workers: true, queue: 'critical', retry: 3

  def perform
    transactions = Transaction.where('created_at <= ?', 1.hour.ago)
    transactions.destroy_all if transactions.any?
  end
end
