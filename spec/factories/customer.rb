FactoryBot.define do
  factory :customer do
    first_name "Tyler"
    last_name "Madsen"
    created_at Date.today
    updated_at Date.today
  end
end
