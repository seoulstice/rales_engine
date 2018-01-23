FactoryBot.define do
  factory :invoice do
    status "shipped"
    created_at Date.today
    updated_at Date.today
  end
end
