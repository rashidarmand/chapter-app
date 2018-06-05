class ProfileController < ApplicationController
  
  def index
    @current_user_books = current_user.books.reverse.uniq
    @q = Book.ransack(params[:q])
    @books = @q.result
  end
  
end
