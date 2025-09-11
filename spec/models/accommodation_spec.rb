require 'rails_helper'
RSpec.describe Accommodation, type: :model do
  describe "associations" do
    it { should have_many(:student_accommodations).dependent(:destroy) }
    it { should have_many(:students).through(:student_accommodations) }
  end

  describe "validations" do
    it { should validate_presence_of(:accommodation_type) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:details).is_at_least(20) }
  end

  describe "accommodation type enum" do
    it do
      is_expected.to define_enum_for(:accommodation_type).with_values(
        presentation: 0,
        response: 1,
        setting: 2,
        timing_and_scheduling: 3
      )
    end
  end

  describe "database columns" do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:details).of_type(:text) }
    it { is_expected.to have_db_column(:accommodation_type)
      .of_type(:integer).with_options(default: "presentation", null: false) }

  end
end
