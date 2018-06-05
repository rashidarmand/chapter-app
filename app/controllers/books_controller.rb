class BooksController < ApplicationController
 
  def index
		@books = Book.all
    @user_book = UserBook.new
    @q = Book.ransack(params[:q])
    @books = @q.result
  end

end
