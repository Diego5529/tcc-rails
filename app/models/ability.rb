class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if !user.admin
        can :access, :rails_admin
        can :dashboard
        can :manage, User, id: user.id
      else
        can :manage, :all
      end
    end
  end
end