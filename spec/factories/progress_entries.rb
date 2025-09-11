FactoryBot.define do
  factory :progress_entry do
    association :student_goal
    association :user, :teacher

    note { "Observed performance on task; student met criteria today." }
    evidence_url { "https://example.com/evidence" }
    score_numeric { 50 }
    recorded_on { Date.today - 3 }
  end
end
