class Accommodation < ApplicationRecord
  has_many :student_accommodations, dependent: :destroy
  has_many :students, through: :student_accommodations
end
