FactoryBot.define do
  factory :merchant do
    sequence(:name) {|n| "Name#{n}"}
    created_at Date.today
    updated_at Date.today
  end
end
