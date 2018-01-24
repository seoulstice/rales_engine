class Merchant < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items)
      .group(:id)
      .order("revenue DESC")
      .limit(quantity)
  end

  def self.revenue(merchant_id)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items, :invoices, :transactions)
      .merge(Transaction.successful)
      .group(:id)
      .find(merchant_id)
  end

end
