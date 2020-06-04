class DonationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can see show page of a donation
  end

  def create?
    record.user == user # Only donation creator can create it
  end

  def update?
    record.user == user # Only donation creator can update it
  end

  def destroy?
    record.user == user # Only donation creator can destroy it
  end
end
