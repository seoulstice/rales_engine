FactoryBot.define do
  factory :merchant do
    sequence(:name) {|n| "Name#{n}"}
  end
end
