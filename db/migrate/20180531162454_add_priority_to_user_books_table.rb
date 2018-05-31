class AddPriorityToUserBooksTable < ActiveRecord::Migration[5.2]
  def change
    add_column :user_books, :priority, :integer
  end
end
