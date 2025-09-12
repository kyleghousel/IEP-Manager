require "rails_helper"

RSpec.describe "Goals", type: :request do
  describe "GET /goals/:id" do
    it "allows teacher" do
      goal = create(:goal, :reading)
      login_as(create(:user, role: "teacher"), scope: :user)

      get goal_path(goal)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(goal.name)
    end

    it "allows parent" do
      goal = create(:goal, :writing)
      login_as(create(:user, role: "parent"), scope: :user)

      get goal_path(goal)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(goal.name)
    end
  end

  describe "GET /goals (policy_scope)" do
    it "admin sees all" do
      active  = create(:goal, name: "Active",  active: true)
      inactive = create(:goal, name: "Inactive", active: false)
      login_as(create(:user, role: "admin"), scope: :user)

      get goals_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Active", "Inactive")
    end
    it "teacher sees only active" do
      active  = create(:goal, name: "Active",  active: true)
      inactive = create(:goal, name: "Inactive", active: false)
      login_as(create(:user, role: "teacher"), scope: :user)

      get goals_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Active")
      expect(response.body).not_to include("Inactive")
    end

    it "parent sees none" do
      create(:goal, name: "Any", active: true)
      login_as(create(:user, role: "parent"), scope: :user)

      get goals_path

      expect(response).to have_http_status(:ok)
      expect(response.body).not_to include("Any")
    end
  end

  describe "POST /goals" do
  it "creates a goal as an admin" do
    admin = create(:user, role: "admin")
    login_as(admin, scope: :user)

    expect {
      post goals_path, params: {
        goal: {
          name: "Identify birds",
          objectives: "Identify 20 birds in one minute with 80% accuracy",
          category: "Science",
          active: true
        }
      }
    }.to change(Goal, :count).by(1)

    expect(response).to redirect_to(goal_path(Goal.last))
    follow_redirect!

    expect(response.body).to include("Identify birds")
  end
  it "prevents goal creation as a parent" do
    parent = create(:user, role: "parent")
    login_as(parent, scope: :user)

    expect {
      post goals_path, params: {
        goal: {
          name: "Identify birds",
          objectives: "Identify 20 birds in one minute with 80% accuracy",
          category: "Science",
          active: true
        }
      }
    }.not_to change(Goal, :count)

    expect(response).to redirect_to(root_path)
    expect(flash[:alert]).to eq("Not authorized")
  end
end
end
