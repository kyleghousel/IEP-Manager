class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :progress_entries, dependent: :destroy

  has_many :children, class_name: "Student", foreign_key: :parent_id

  ROLES = %w[parent teacher admin].freeze

  validates :role, presence: true, inclusion: { in: ROLES }

  scope :parents_only, -> { where(role: "parent") }

  def parent?
    role == "parent"
  end

  def teacher?
    role == "teacher"
  end

  def admin?
    role == "admin"
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

private

  def restrict_admin_signup
    return unless role == "admin" && new_record?

    errors.add(:role, "cannot be admin at signup")
  end
end
