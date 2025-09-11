FactoryBot.define do
  factory :student_accommodation do
    sequence(:notes) { |n| "Test#{n}" }
    start_on { 3.months.ago.to_date }
    end_on { 9.months.from_now.to_date }

    trait :sit_closer do
      notes { "Student needs to sit near the front of the class." }
    end

    trait :frequent_breaks do
      notes { "Student requires breaks to walk around." }
    end
  end
end
