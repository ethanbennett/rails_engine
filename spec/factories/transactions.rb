FactoryGirl.define do
  factory :transaction do
    credit_card_number "#{Faker::Number.number(4)}"
    result "#{["failed", "success"].sample}"
  end
end
