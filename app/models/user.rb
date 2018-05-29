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
end
