class ReadController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
        @books = @q.result
  end

  def show
    @q = Book.ransack(params[:q])
        @books = @q.result
    @book = Book.find(params[:id])
    @chapters = @book.chapters.order(:chapter_order)
  end

  def chapter
    @q = Book.ransack(params[:q])
        @books = @q.result
    @chapter = Chapter.find(params[:chapter_id])
   
    @chunk_of_chapter = @chapter.broken_up_chapters.paginate(:page => params[:page], :per_page => 1)
   
    if Chapter.find(@chapter.id + 1).book_id == @chapter.book_id && Chapter.find(@chapter.id + 1).chapter_order == @chapter.chapter_order + 1
      @next_chapter = Chapter.find(@chapter.id + 1)
    end

    if @chapter != @chapter.book.chapters.first && Chapter.find(@chapter.id - 1).book_id == @chapter.book_id && Chapter.find(@chapter.id - 1).chapter_order == @chapter.chapter_order - 1
      @previous_chapter = Chapter.find(@chapter.id - 1)
    end

    if @chapter == @chapter.book.chapters.last && current_user.books.include?(@chapter.book)
      @user_book = UserBook.find_by(user_id: current_user.id, book_id: @chapter.book.id)
    end

  end
end
