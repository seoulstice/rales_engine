FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status "shipped"
  end
end
