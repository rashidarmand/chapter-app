class Book < ApplicationRecord
  has_many :chapters
  has_many :user_books
  has_many :books, through: :user_books

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
end
