class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoice_items)
      .select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
      .group(:id)
      .order("revenue DESC")
      .limit(quantity.to_i)
  end

  def self.most_items(quantity)
    select("items.*, sum(invoice_items.quantity) AS count")
      .joins(:invoice_items)
      .group(:id)
      .order("count DESC")
      .limit(quantity.to_i)
  end

  def best_day
    invoices
      .select("invoices.created_at, sum(invoice_items.quantity) AS count")
      .joins(:invoice_items)
      .group("invoices.id, date(invoices.created_at)")
      .order("count DESC, invoices.created_at DESC")
      .limit(1)
      .first
  end


end
