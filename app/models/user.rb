class User < ApplicationRecord
  has_many :progress_entries, dependent: :destroy
  has_many :meetings, foreign_key: :organizer_id, dependent: :destroy

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
end
