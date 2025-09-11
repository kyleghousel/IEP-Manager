class StudentGoal < ApplicationRecord
  belongs_to :student
  belongs_to :goal
  has_many :progress_entries, dependent: :destroy

  accepts_nested_attributes_for :progress_entries, reject_if: ->(attributes) { attributes["recorded_on", "note"].blank? }
end
