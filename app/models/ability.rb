class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? 'admin'
      can :manage, :all
      can :create, :all
    else
      can :read, Course::Master
      can :read, Course::Event
    end
    if user.has_role? 'finance'
      can :see_finance, :all
    else
      cannot :see_finance, :all
    end
  end
end
