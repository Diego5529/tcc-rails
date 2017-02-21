class Ability
  include CanCan::Ability

  def initialize(user)
    
    # user ||= User.new # guest user (not logged in)
    # if user.admin?
    #     can :manage, :all
    # else
    #     can :read, :all
    # end
    
    if user
      if !user.admin
        can :access, :rails_admin
        can :dashboard
        can :manage, User, id: user.id
        can :manage, Company, Company.unowned(user) do |photo|
            photo.user_company_types
        end
      else
        can :manage, :all
      end
    end
  end
end