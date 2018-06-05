class SearchController < ApplicationController
    def index
        @q = Book.ransack(params[:q])
        @books = @q.result
        @user_book = UserBook.new

    end



end