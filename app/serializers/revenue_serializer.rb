class RevenueSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :revenue

  def revenue
    number_with_precision(object.revenue/100, precision: 2)
  end
end
