class StudentPolicy < ApplicationPolicy
  def index?
    user.admin? || user.teacher?
  end

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
        scope.all # later: maybe only their assigned students
      elsif user.parent?
        scope.none # or filter to just their child
      else
        scope.none
      end
    end
  end
end
