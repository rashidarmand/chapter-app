class AccountController < ApplicationController
    def index
        @users = User.all
        @user = User.find(1)
  
      end

    def update

    end
end
