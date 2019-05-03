module Api
  class DepositPolicy < ApplicationPolicy
    attr_reader :user, :deposit

    def initialize (user, deposit)
      @user = user
      @deposit = deposit
    end  
  
    def index?
      user.role?(deposit) || user.role?(admin)
    end
  
    def search?
      user.role?(deposit) || user.role?(admin)
    end
  
    def create?
      user.role?(deposit) || user.role?(admin)
    end
  
end
