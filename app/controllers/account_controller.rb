class AccountController < ApplicationController
  def index
    @users = User.all
    @user = User.find(1)
    @q = Book.ransack(params[:q])
    @books = @q.result
  end


end
