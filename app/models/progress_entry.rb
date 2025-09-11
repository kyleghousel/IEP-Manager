class ProgressEntry < ApplicationRecord
  belongs_to :student_goal
  belongs_to :user

  validates :recorded_on, :note, presence: true
  validates :note, length: { in: 30..250 }
  validates :score_numeric, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100,
    allow_nil: true,
  }
end
