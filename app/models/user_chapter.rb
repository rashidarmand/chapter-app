class UserChapter < ApplicationRecord
  belongs_to :chapter
  belongs_to :user

  validates :chapter_id, presence: true
  validates :user_id, presence: true
end


