require 'rails_helper'
RSpec.describe Student, type: :model do
  describe "associations" do
    it { should have_many(:student_goals).dependent(:destroy) }
    it { should have_many(:goals).through(:student_goals) }
    it { should have_many(:student_accommodations).dependent(:destroy) }
    it { should have_many(:accommodations).through(:student_accommodations) }
    it { should have_many(:meetings).dependent(:destroy) }
  end
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:dob) }
    it { should validate_presence_of(:diagnosis) }
  end
  describe "dependent destroys", :pending do
    it "destroys a student_goal when destroyed" do
      student_goal = create(:student_goal)
    end
    it "destroys a student_accommodation when destroyed" do
      student_accommodation = create(:student_accommodation)
    end
    it "destroys a meeting when destroyed" do
      meeting = create(:meeting)
    end
  end

  describe "#full_name" do
    it "returns the student's full name" do
      student = create(:student)
      expect(student.full_name).to eq("#{student.first_name} #{student.last_name}")
    end
  end
end
