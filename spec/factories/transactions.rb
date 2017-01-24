FactoryGirl.define do
  factory :transaction do
    credit_card_number "#{Faker::Number.number(4)}"
    invoice
    result "#{["failed", "success"].sample}"
  end
end
