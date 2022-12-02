class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
  end

  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def checkout?
    true
  end

end
