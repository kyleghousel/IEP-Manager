FactoryBot.define do
  factory :progress_entries do
    sequence(:note) { |n| "Test#{n}" }
    evidence_url { "https://bryanreed.com" }
    score_numeric { 50 }
    recorded_on { 3.days.ago }
  end
end
