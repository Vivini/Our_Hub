class ErrorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    return true
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def destroy?
    record.visit == visit
  end
end
