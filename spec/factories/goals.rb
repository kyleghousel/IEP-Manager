FactoryBot.define do
  factory :goal do
    name { "Generic Goal" }
    objectives { "Student will achieve this objective with 80% accuracy." }
    category { "Math" }
    active { true }

    trait :reading do
      name { "Read 10 grade-level words in 20 seconds" }
      objectives { "Given a word list, student will read aloud 10 grade-level words within 20 seconds across 3 consecutive trials." }
      category { "Reading" }
    end

    trait :writing do
      name { "Write within the margins" }
      objectives { "Student will consistently write within lined margins across assignments with no more than 2 prompts." }
      category { "Writing" }
    end

    trait :life_skills do
      name { "Fold laundry" }
      objectives { "Student will fold a basket of laundry independently in under 15 minutes." }
      category { "Life Skills" }
    end
  end
end
