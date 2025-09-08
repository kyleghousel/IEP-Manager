class StudentAccommodation < ApplicationRecord
  belongs_to :student
  belongs_to :accommodation
end
