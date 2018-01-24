FactoryBot.define do
  factory :invoice_item do
    quantity 5
    unit_price 12323
    item
    invoice
    created_at Date.today
    updated_at Date.today
  end
end
