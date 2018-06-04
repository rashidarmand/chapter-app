class ReadController < ApplicationController
  def index
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
   
    if Chapter.find(@chapter.id + 1).book_id == @chapter.book_id 
      @next_chapter = Chapter.find(@chapter.id + 1)
    end
    # if Chapter.find(@chapter.id - 1).book_id == @chapter.book_id
    #   if @chapter.id != 1 
    #     @previous_chapter = Chapter.find(@chapter.id - 1)
    #   end
    # end

  end
end
