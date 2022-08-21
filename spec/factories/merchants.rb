FactoryBot.define do
  factory :merchant do
    name { Faker::Name.name }
    description { Faker::Lorem.characters }
    status { 'active' }
    total_transaction_sum { Faker::Number.positive }

    user
  end

  trait :invalid_transaction_sum do
    role { Faker::Number.negative }
  end
end
