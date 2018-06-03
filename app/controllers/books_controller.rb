class BooksController < ApplicationController
<<<<<<< HEAD
    def index
        @q = Book.ransack(params[:q])
        @books = @q.result

      end
end
  def index
		@books = Book.all
		@user_book = UserBook.new
  end

end
