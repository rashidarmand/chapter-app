class ReadController < ApplicationController
  def index
    # @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @chapters = @book.chapters.order(:chapter_order)
  end

  def chapter

  end
end
