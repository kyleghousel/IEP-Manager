class Student < ApplicationRecord
  has_many :student_goals, dependent: :destroy
  has_many :goals, through: :student_goals

  has_many :student_accommodations, dependent: :destroy
  has_many :accommodations, through: :student_accommodations

  belongs_to :parent, class_name: "User", optional: true

  validates :first_name, :last_name, :dob, :diagnosis, presence: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
