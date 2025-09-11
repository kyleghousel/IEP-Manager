require 'rails_helper'
RSpec.describe StudentAccommodation, type: :model do
  describe "associations" do
    it { should belong_to(:student) }
    it { should belong_to(:accommodation) }
  end

  describe "validations" do
    it { is_expected.to validate_length_of(:notes).is_at_least(20) }
  end

  describe "database columns" do
    it { is_expected.to have_db_column(:start_on).of_type(:date) }
    it { is_expected.to have_db_column(:end_on).of_type(:date) }
    it { is_expected.to have_db_column(:notes).of_type(:text) }
  end
end
