FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name  { "User" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    role { "teacher" }

    trait :admin do
      role { "admin" }
    end

    trait :parent do
      role { "parent" }
    end
  end
end
