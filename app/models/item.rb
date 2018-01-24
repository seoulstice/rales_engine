class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:invoice_items)
    .group(:id)
    .order("revenue DESC")
    .limit(quantity.to_i)
  end
end

Item.select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue").joins(:invoice_items).group(:id).order("revenue DESC").limit(2)
