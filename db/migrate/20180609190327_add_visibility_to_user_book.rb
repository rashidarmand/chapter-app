class AddVisibilityToUserBook < ActiveRecord::Migration[5.2]
  def change
    add_column :user_books, :visible, :boolean

  end
end
