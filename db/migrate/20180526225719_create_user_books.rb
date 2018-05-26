class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.integer :user_id
      t.integer :chapter_id
      t.boolean :read
      t.timestamps
    end
  end
end
