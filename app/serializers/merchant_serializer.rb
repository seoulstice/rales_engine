class MerchantSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :revenue

  def revenue
    (object.revenue/100).round(2)
  end

end
