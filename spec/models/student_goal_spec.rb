FactoryBot.define do
  factory :student_goal do
    association :student
    association :goal

    start_on { Date.today }
    target_date { 6.months.from_now.to_date}
    baseline { "50" }
    target_value { "80" }
    status { "in_progress "}
    mastery_percent { 90 }
  end
end
