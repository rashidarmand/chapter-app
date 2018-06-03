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
    @chunk_of_chapter = @chapter.broken_up_chapters.paginate(:page => params[:page], :per_page => 1)
  end
end
