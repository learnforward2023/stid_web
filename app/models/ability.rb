# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :manage, User
      can :manage, Company
      can :manage, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
    else
      can :manage, Company, id: user.company_ids
      can :create, Company
      can :manage, User, id: User.joins(:companies).where(companies: { id: user.company_ids }).ids
      can :create, User
      can :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
    end
  end
end
