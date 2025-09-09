class Goal < ApplicationRecord
  has_many :student_goals, dependent: :destroy
  has_many :students, through: :student_goals

  validates :name, :objectives, presence: true

  scope :active_only, -> { where(active: true) }
end
