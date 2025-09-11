require 'rails_helper'
RSpec.describe StudentGoal, type: :model do
  describe "associations" do
    it { should belong_to(:student) }
    it { should belong_to(:goal) }
    it { should have_many(:progress_entries).dependent(:destroy) }
  end

  describe "database columns" do
    it { is_expected.to have_db_column(:start_on).of_type(:date) }
    it { is_expected.to have_db_column(:target_date).of_type(:date) }
    it { is_expected.to have_db_column(:baseline).of_type(:string) }
    it { is_expected.to have_db_column(:target_value).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:string) }
    it { is_expected.to have_db_column(:mastery_percent).of_type(:integer) }
  end
end
