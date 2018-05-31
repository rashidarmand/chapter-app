class BooksController < ApplicationController
    def index
        @q = Book.ransack(params[:q])
        @books = @q.result
      end
end