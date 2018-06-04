class ReadController < ApplicationController
  def index
    # @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @chapters = @book.chapters.order(:chapter_order)
  end

  def chapter
    @chapter = Chapter.find(params[:chapter_id])
    # if Chapter.find(params[:chapter_id] + 1).book_id == @chapter.book_id 
    #   @next_chapter = Chapter.find(params[:chapter_id] + 1)
    # end
    # if Chapter.find(params[:chapter_id] - 1).book_id == @chapter.book_id 
    #   @previous_chapter = Chapter.find(params[:chapter_id] - 1)
    # end
    @chunk_of_chapter = @chapter.broken_up_chapters.paginate(:page => params[:page], :per_page => 1)
  end
end
