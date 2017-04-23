class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize(user, item)
    @user = user
    @item = item
  end

  def update?
    user.admin? or not item.published?
  end

  def destroy?
   user.admin?
  end

  class Scope < Scope
    def resolve
     scope
    end
  end

end
