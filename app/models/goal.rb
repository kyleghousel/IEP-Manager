class Goal < ApplicationRecord
  has_many :student_goals, dependent: :destroy
  has_many :students, through: :student_goals
end
