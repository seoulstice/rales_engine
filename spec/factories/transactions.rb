FactoryBot.define do
  factory :transaction do
    invoice
    sequence(:credit_card_number) {|n| "0000#{n}"}
    credit_card_expiration_date Date.today
    result "success"
  end
end
