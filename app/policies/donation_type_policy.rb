class DonationTypePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   user.charity? ? scope.all : scope.where(user: user)
    # end
  end

  def show?
    user.charity?
  end

  def new?
    user.charity?
  end

  def create?
    user.charity?
  end

  def edit?
    user.charity?
  end

  def update?
    user.charity?
  end

  def destroy?
    user.charity?
  end

end
