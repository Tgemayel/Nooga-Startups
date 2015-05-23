class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Anonymous user abilities
    can :read, Job
    can :new, Job
    
    # Signed in user abilities
    #

    # Users that own a Job
    can :edit, Job do |job|
      job.try(:user) == user
    end

    can :update, Job do |job|
      job.try(:user) == user
    end

    can :destroy, Job do |job|
      job.try(:user) == user
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
