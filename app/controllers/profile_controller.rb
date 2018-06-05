class ProfileController < ApplicationController
  def index
  
    @current_user_books = current_user.books.reverse
    @q = Book.ransack(params[:q])
        @books = @q.result
  end

  def book_finished
    puts 'something'
  end
  
end
