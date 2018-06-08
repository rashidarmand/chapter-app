class UserChaptersController < ApplicationController
  def index
  end

  def new
    @user_chapter = UserChapter.new
  end

  def create
    @user_chapter = UserChapter.new(user_chapter_params)
    respond_to do |format|
      if @user_chapter.save
        format.html { redirect_to profile_index_path, notice: 'Chapter Completed!' }
        format.json { render :show, status: :created, location: :back }
      else
        format.html { redirect_to profile_index_path, notice: 'Oops There Was An Issue.Please Try Again Later !' }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_chapter = UserChapter.find(params[:id])

    UserChapter.destroy(@user_chapter.id)

    respond_to do |format|
      format.html { redirect_to profile_index_path, notice: 'Chapter successfully removed!' }
      format.json { head :no_content }
    end

  end

  def update
    @user_chapter = UserChapter.find_by(user_chapter_params.values)
    # @user_book = UserBook.find(params[:id])
    respond_to do |format|
      if @user_chapter.update(user_chapter_params)
        format.html { redirect_to profile_index_path, notice: 'Chapter Completed!' }
        format.json { render :show, status: :created, location: books_path }
      else
        format.html { render :new }
        format.json { render json: profile_path.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_chapter
    # @user_book = UserBook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_chapter_params
    params.require(:user_chapter).permit(:user_id, :chapter_id, :read)
  end

  def bookmark_params
    params.require(:user_chapter).permit(:bookmark)
  end
end
