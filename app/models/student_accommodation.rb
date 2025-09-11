class StudentAccommodation < ApplicationRecord
  belongs_to :student
  belongs_to :accommodation

  validates :notes, length: { minimum: 20 }
end
