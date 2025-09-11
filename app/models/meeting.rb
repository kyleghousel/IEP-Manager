class Meeting < ApplicationRecord
  belongs_to :student
  belongs_to :organizer, class_name: "User"
end
