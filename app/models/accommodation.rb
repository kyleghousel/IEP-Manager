class Accommodation < ApplicationRecord
  has_many :student_accommodations, dependent: :destroy
  has_many :students, through: :student_accommodations

  enum :accommodation_type,
       { presentation: 0, response: 1, setting: 2, timing_and_scheduling: 3 }
end
