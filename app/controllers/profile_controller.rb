class ProfileController < ApplicationController
  def index
  
    @current_user_books = current_user.books.reverse.uniq

  end

  def book_finished
    puts 'something'
  end
  
end
