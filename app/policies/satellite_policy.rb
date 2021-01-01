class SatellitePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user or user.try(:admin?)
  end

  def destroy?
    user.try(:admin?)
  end
end