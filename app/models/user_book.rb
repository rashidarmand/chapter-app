class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: true
  validates :user_id, uniqueness: true
  validates :book_id, presence: true
  validates :user_id, presence: true
end
