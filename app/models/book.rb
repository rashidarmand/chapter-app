class Book < ApplicationRecord
  
  has_many :chapters
  has_many :user_books
  has_many :books, through: :user_books

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  
end

def self.search(search)
  if search
    find(:all, :conditions=>["title LIKE ? OR genre LIKE ? OR author LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end