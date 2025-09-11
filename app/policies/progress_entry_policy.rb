class ProgressEntryPolicy < ApplicationPolicy
  def create?
    user.admin? || user.teacher?
  end

  def destroy?
    user.admin? || user.teacher?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.teacher?
        scope.all
      elsif user.parent?
        scope.none
      else
        scope.none
      end
    end
  end
end
