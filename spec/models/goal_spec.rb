require 'rails_helper'
RSpec.describe Goal, type: :model do
  describe "associations" do
    it { should have_many(:student_goals).dependent(:destroy) }
    it { should have_many(:students).through(:student_goals) }
  end
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:objectives) }
    it { should allow_value(true, false).for(:active) }
  end

  describe ".active_only" do
    it "returns only active goals" do
      active1  = create(:goal, active: true)
      inactive = create(:goal, active: false)
      active2  = create(:goal, active: true)

      result = described_class.active_only

      expect(result).to match_array([active1, active2])
      expect(result).not_to include(inactive)
    end
  end
end
