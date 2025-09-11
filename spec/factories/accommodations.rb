FactoryBot.define do
  factory :accommodation do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:details) { |n| "Details#{n}" }
    accommodation_type { 0 }

    trait(:presentation)           { accommodation_type { :presentation } }
    trait(:response)               { accommodation_type { :response } }
    trait(:setting)                { accommodation_type { :setting } }
    trait(:timing_and_scheduling)  { accommodation_type { :timing_and_scheduling } }
  end
end
