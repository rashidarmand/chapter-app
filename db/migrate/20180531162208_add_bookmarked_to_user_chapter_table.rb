class AddBookmarkedToUserChapterTable < ActiveRecord::Migration[5.2]
  def change
    add_column :user_chapters, :bookmarked, :boolean, :default => false
  end
end
