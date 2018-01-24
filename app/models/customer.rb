class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices


  def self.customers_with_pending_invoices(merchant_id)
    joins(:merchants, :transactions)
      .merge(Transaction.unsuccessful)
      .where("merchants.id = #{merchant_id}")
  end
end
