class Student < ApplicationRecord
  has_many :student_goals, dependent: :destroy
  has_many :goals, through: :student_goals

  has_many :student_accommodations, dependent: :destroy
  has_many :accommodations, through: :student_accommodations

  has_many :meetings, dependent: :destroy

  validates :first_name, :last_name, :dob, :diagnosis, presence: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
