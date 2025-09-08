class ProgressEntry < ApplicationRecord
  belongs_to :student_goal
  belongs_to :user
end
