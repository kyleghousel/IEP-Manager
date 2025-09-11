require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:progress_entries).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:role) }
    it { should validate_inclusion_of(:role).in_array(%w[parent teacher admin]) }
  end

  describe "db constraints" do
    it { should have_db_index(:email).unique(true) }
  end

  describe "#parent?" do
    context "when role is parent" do
      let(:user) { build(:user, role: "parent") }
      it { expect(user.parent?).to be true }
    end

    context "otherwise" do
      let(:user) { build(:user, role: "teacher") }
      it { expect(user.parent?).to be false }
    end
  end

  describe "#teacher?" do
    context "when role is teacher" do
      let(:user) { build(:user, role: "teacher") }
      it { expect(user.teacher?).to be true }
    end

    context "otherwise" do
      let(:user) { build(:user, role: "parent") }
      it { expect(user.teacher?).to be false }
    end
  end

  describe "#admin?" do
    context "when role is admin" do
      let(:user) { build(:user, role: "admin") }
      it { expect(user.admin?).to be true }
    end

    context "otherwise" do
      let(:user) { build(:user, role: "teacher") }
      it { expect(user.admin?).to be false }
    end
  end

end
