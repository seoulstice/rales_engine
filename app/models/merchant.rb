class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items])
      .group(:id)
      .order("revenue DESC")
      .limit(quantity)
  end

  def self.revenue(merchant_id)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .group(:id)
      .find(merchant_id)
      .revenue
  end

  def self.revenue_on_date(merchant_id, date)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .where(invoices: {created_at: date})
      .group(:id)
      .find(merchant_id)
      .revenue
  end

  def self.all_revenue_by_date(date)
      joins(invoices: [:invoice_items])
      .where(invoices: {created_at: date})
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

end

# Merchant.joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).where(invoices: {created_at: date}).sum("invoice_items.quantity * invoice_items.unit_price")
