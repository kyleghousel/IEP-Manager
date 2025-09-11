FactoryBot.define do
  factory :student_goals do
    sequence(:notes) { |n| "Test#{n}" }
    start_on { 3.months.ago.to_date }
    baseline { "20wpm" }
    target_value { "80wpm" }
    target_date { 9.months.from_now.to_date }
    status { "in_progress"}
    mastery_percent { 90 }
  end
end
