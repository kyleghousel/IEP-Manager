FactoryBot.define do
  factory :accommodations do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:details) { |n| "Detailsdetailsdetailsdetailsdetailsdetailsdetailsdetailsdetails#{n}" }
    accommodation_type { Accommodation.accommodation_types.values.sample}
  end
end
