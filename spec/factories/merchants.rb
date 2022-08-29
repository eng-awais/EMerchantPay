FactoryBot.define do
  factory :merchant do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    description { Faker::Lorem.characters }
    status { 'active' }
    total_transaction_sum { Faker::Number.positive }
  end
end
