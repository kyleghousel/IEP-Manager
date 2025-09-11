class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :progress_entries, dependent: :destroy

  ROLES = %w[parent teacher admin].freeze

  validates :role, presence: true, inclusion: { in: ROLES }

  def parent?
    role == "parent"
  end

  def teacher?
    role == "teacher"
  end

  def admin?
    role == "admin"
  end

private

  def restrict_admin_signup
    return unless role == "admin" && new_record?

    errors.add(:role, "cannot be admin at signup")
  end
end
