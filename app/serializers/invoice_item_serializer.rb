class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :unit_price, :item_id, :quantity, :invoice_id

  def unit_price
    (object.unit_price/100).to_s
  end
end
