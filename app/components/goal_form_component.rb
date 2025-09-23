# frozen_string_literal: true

class GoalFormComponent < ViewComponent::Base
  attr_reader :goal

  def initialize(goal:)
    @goal = goal
  end
end
