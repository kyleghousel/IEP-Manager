class StudentGoal < ApplicationRecord
  belongs_to :student
  belongs_to :goal
  has_many :progress_entries, dependent: :destroy

  validates :start_on,
            :target_date,
            :baseline,
            :target_value,
            :status,
            :mastery_percent,
            presence: true
end
