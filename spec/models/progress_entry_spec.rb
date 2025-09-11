require 'rails_helper'
RSpec.describe ProgressEntry, type: :model do
  subject { build(:progress_entry) }
  describe "associations" do
    it { should belong_to(:student_goal) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:recorded_on) }
    it { should validate_presence_of(:note) }
    it { is_expected.to validate_length_of(:note).is_at_least(30).is_at_most(250) }
    it { is_expected.to validate_numericality_of(:score_numeric)
         .only_integer
         .is_greater_than_or_equal_to(0)
         .is_less_than_or_equal_to(100)
         .allow_nil }g
    it { should validate_numericality_of(:score_numeric).only_integer }
  end

  describe "database columns" do
    it { is_expected.to have_db_column(:recorded_on).of_type(:date).with_options(null: false) }
    it { is_expected.to have_db_column(:note).of_type(:text) }
    it { is_expected.to have_db_column(:evidence_url).of_type(:string) }
    it { is_expected.to have_db_column(:score_numeric).of_type(:integer) }
  end
end
