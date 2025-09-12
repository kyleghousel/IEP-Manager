class GoalPolicy < ApplicationPolicy
  def show?
    user.admin? || user.teacher? || user.parent?
  end

  def create?
    user.admin? || user.teacher?
  end

  def update?
    user.admin? || user.teacher?
  end

  def destroy?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.teacher?
        scope.active_only
      elsif user.parent?
        scope.none
      else
        scope.none
      end
    end
  end
end
