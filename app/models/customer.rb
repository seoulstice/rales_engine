class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.customers_with_pending_invoices(merchant_id)
    find_by_sql("SELECT c.* FROM customers c
                JOIN invoices i ON c.id = i.customer_id
                JOIN transactions t ON t.invoice_id = i.id
                WHERE i.merchant_id = #{merchant_id}
                EXCEPT SELECT c.* FROM customers c
                JOIN invoices i ON c.id = i.customer_id
                JOIN transactions t ON t.invoice_id = i.id
                WHERE i.merchant_id = #{merchant_id} AND t.result = 'success' ORDER BY 1")
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
