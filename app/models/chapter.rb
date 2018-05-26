class Chapter < ApplicationRecord
  belongs_to :book

  validates :chapter_order, presence: true
  validates :content, presence: true
  validates :book_id, presence: true
end
