# frozen_string_literal: true

class GoalFormComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
