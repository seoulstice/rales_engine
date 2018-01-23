class TransactionSerializer < ActiveModel::Serializer
  attributes :id,
             :invoice_id,
             :credit_card_number,
             :result

  def credit_card_number
    object.credit_card_number.to_s
  end
end
