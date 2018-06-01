class Chapter < ApplicationRecord
  
  belongs_to :book
  has_many :user_chapters
  has_many :users, through: :user_chapters

  validates :chapter_order, presence: true
  validates :content, presence: true
  validates :book_id, presence: true

  def exceed_200_words?
    
  end
  
  def exceed_200_words
    Chapter.first.content.scan(/\w+/).count
    if self.content.scan(/\w+/).count > 200

      truncate 


    end


  end

end
