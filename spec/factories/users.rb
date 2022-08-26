FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    type { %w[AdminUser MerchantUser].sample }
  end
end
