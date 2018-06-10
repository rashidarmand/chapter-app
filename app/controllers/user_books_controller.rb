class UserBooksController < ApplicationController
  def index
  end

  def new
    @user_book = UserBook.new
  end

  def create
    @user_book = UserBook.new(user_book_params)
    respond_to do |format|
      if @user_book.save
        user = User.find(@user_book.user_id)
        chapters = Chapter.where(book_id: @user_book.book_id)

        chapters.each do |chapter|
          UserChapter.create(user_id: user.id, chapter_id:chapter.id)
        end
        
        format.html { redirect_to books_path, notice: 'Book successfully added!' }
        format.json { render :show, status: :created, location: books_path }
      else
        format.html { redirect_to books_path, notice: 'Oops There Was An Issue Adding The Book. Please Try Again Later !' }
        format.json { render json: books_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_book = UserBook.find(params[:id])

    UserBook.destroy(@user_book.id)

    respond_to do |format|
      format.html { redirect_to profile_index_path, notice: 'Book successfully removed!' }
      format.json { head :no_content }
    end

  end

  def update
    @user_book = UserBook.find_by(user_book_params.values)
    # @user_book = UserBook.find(params[:id])
    respond_to do |format|
      if @user_book.update(user_book_params)
        format.html { redirect_to profile_index_path, notice: 'Book Completed!' }
        format.json { render :show, status: :created, location: books_path }
      else
        format.html { render :new }
        format.json { render json: profile_path.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_book
    # @user_book = UserBook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_book_params
    params.require(:user_book).permit(:user_id, :book_id, :read, :priority)
  end

end
