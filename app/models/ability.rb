# frozen_string_literal: false
# Avility
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    if user.role == 'super_admin'
      can :manage, :all
    elsif user.role == 'admin'
      can :manage, :all
      cannot :manage, :admin
    else
      can :read, user
      can :create, User
      can :update, user
    end
  end
end
