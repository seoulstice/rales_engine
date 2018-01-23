FactoryBot.define do
  factory :item do
    name "Banana Stand"
    description "There's always money in the banana stand!"
    unit_price 75107
    created_at Date.today
    updated_at Date.today
  end
end
