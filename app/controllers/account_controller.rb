class AccountController < ApplicationController
    def index
        @users = User.all
        # @user = User.find_by(params[:id])

  
      end

    # def create
    #     if params[:email]
    #       @user.update(email: params[:email])
    #       redirect_to account_path
    #       flash[:success] = "Email Succesfully Updated"
    #     elsif params[:password]
    #       @user.update(password: params[:password])
    #       redirect_to account_path
    #       flash[:success] = "Password Succesfully Updated"
    #     end
    # end
end
