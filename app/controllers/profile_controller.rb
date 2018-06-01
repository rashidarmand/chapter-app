class ProfileController < ApplicationController
  def index
    
      @current_user_books = current_user.books.reverse

    # unless current_user.books.empty?
      # current_user.books.each{|ub| @ub}
      # @destroy_user_book = UserBook.destroy()
    # end

  end
end
