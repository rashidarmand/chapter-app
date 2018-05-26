class Book < ApplicationRecord
  searchkick
  has_many :chapters

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
end
