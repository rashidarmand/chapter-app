class User < ApplicationRecord
  include Clearance::User
  has_many :user_books
  has_many :books, through: :user_books

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
