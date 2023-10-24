class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new

    can :manage, Group
    can :manage, Exchange
  end
end
