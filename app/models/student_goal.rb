class StudentGoal < ApplicationRecord
  belongs_to :student
  belongs_to :goal
  has_many :progress_entries, dependent: :destroy
end
