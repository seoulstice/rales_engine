class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

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
    joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .where("date(invoices.created_at) = date('#{date}')")
      .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_items(merchant_count)
    select("merchants.*, sum(invoice_items.quantity) AS items_sold")
      .joins(invoices: [:invoice_items])
      .group(:id)
      .order("items_sold DESC")
      .limit(merchant_count)
  end

  def self.favorite_merchant(customer_id)
    select("merchants.*, count(transactions.id) AS count_transactions")
      .joins(:customers, invoices: [:transactions])
      .merge(Transaction.successful)
      .where("customers.id = #{customer_id}")
      .group(:id)
      .order("count_transactions DESC")
      .limit(1)
      .first
  end

end
