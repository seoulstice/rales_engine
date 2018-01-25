class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.customers_with_pending_invoices(merchant_id)
    joins(:merchants, :transactions)
      .merge(Transaction.unsuccessful)
      .where("merchants.id = #{merchant_id}")
  end

  def self.favorite_customer(merchant_id)
    select("customers.*, count(transactions.id) as count_transactions")
      .joins(:merchants, invoices: [:transactions])
      .merge(Transaction.successful)
      .where("merchants.id = #{merchant_id}")
      .group(:id)
      .order("count_transactions DESC")
      .limit(1)
      .first
  end
end
