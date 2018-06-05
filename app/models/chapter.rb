class Chapter < ApplicationRecord
  
  belongs_to :book
  has_many :user_chapters
  has_many :users, through: :user_chapters

  validates :chapter_order, presence: true
  validates :content, presence: true
  validates :book_id, presence: true

  
  # Check if chapter has more than 250 words in it
  def long_chapter?
    if self.content.split(' ').count > 250
      true
    else
      false
    end
  end

  # Breaks down chapter into an array of arrays. The inner arrays have at most 250 words.
  def broken_up_chapters
    content_array = self.content.split()
    small_chunks_array = []
    
    while content_array.length > 250 do
      small_chunks_array.push(content_array[0...250].join(' '))
      content_array.shift(250)
    end

    small_chunks_array.push(content_array[0...250].join(' '))

    return small_chunks_array
  end

  
end
