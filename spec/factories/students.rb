FactoryBot.define do
  factory :student do
    sequence(:first_name) { |n| "Test#{n}" }
    sequence(:last_name)  { |n| "Student#{n}" }
    dob { 10.years.ago.to_date }
    diagnosis { "Autism Spectrum Disorder" }
    grade_level { "9th" }

    trait :elementary do
      grade_level { "3rd" }
      diagnosis { "ADHD" }
    end

    trait :middle do
      grade_level { "7th" }
      diagnosis { "Specific Learning Disability" }
    end

    trait :high_school do
      grade_level { "12th" }
      diagnosis { "Down Syndrome" }
    end
  end
end
