# •	unauthenticated: redirect to login on any page
# •	teacher: 403/redirect on POST/PUT/DELETE
# •	admin: can create/update/destroy; sees flash; redirect paths correct
# •	validation failure returns 422 and renders errors
# spec/requests/goals_spec.rb
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
end
