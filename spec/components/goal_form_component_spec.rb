# frozen_string_literal: true

require "rails_helper"

RSpec.describe GoalFormComponent, type: :component do
  it "renders the form fields" do
    goal  = create(:goal, active: true)

    render_inline(described_class.new(goal: goal))

    expect(page).to have_selector("form")
    expect(page).to have_field("Name")
    expect(page).to have_field("Objectives")
  end

  it "shows Update when persisted" do
    goal = create(:goal, active: true)

    render_inline(described_class.new(goal: goal))

    expect(page).to have_button("Update Goal")
  end
end
