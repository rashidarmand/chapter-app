class User < ApplicationRecord

  include Clearance::User
  has_many :user_books
  has_many :books, through: :user_books
  has_many :user_chapters
  has_many :chapters, through: :user_chapters

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def books_read
    if self.books.length==0
      return 0
    else
    self.books.where("read = true").count
    end
 end

  def chapters_read
    if self.chapters.length==0
      return 0
    else
    self.chapters.where("read = true").count
    end
  end

end
