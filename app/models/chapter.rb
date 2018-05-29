class Chapter < ApplicationRecord
  
  belongs_to :book
  has_many :user_chapters
  has_many :users, through: :user_chapters

  validates :chapter_order, presence: true
  validates :content, presence: true
  validates :book_id, presence: true
  
end
