FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  trait :admin do
    role { 0 }
  end

  trait :merchant do
    role { 0 }
  end

  trait :invalid_role do
    role { 2 }
  end
end
