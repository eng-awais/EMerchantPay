FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.positive }
    status { 'approved' }
    type { ['AuhtorizeTransaction', 'RefundTransaction', 'ChargeTransaction', 'ReverseTransaction'].sample }
    customer_email { Faker::Internet.email }
    customer_phone { Faker::PhoneNumber.cell_phone }

    merchant
  end
end
