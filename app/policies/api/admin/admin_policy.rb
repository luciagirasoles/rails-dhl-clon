module Api
  class AdminPolicy < ApplicationPolicy
  
    attr_reader :user, :admin

    def initialize (user, admin)
      @user = user
      @admin = admin
    end
  
    def index?
      user.role?(admin)
    end
  
    def search?
      user.role?(admin)
    end
  
    def create?
      user.role?(admin)
    end
    
    def new?
      user.role?(admin)
    end
  
    def delivered?
      user.role?(admin)
    end
  
    def edit?
      user.role?(admin)
    end
  
    def update?
      user.role?(admin)
    end
  
    def destroy?
      user.role?(admin)
    end
  
  end
end

