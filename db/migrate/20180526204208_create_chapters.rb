class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :title
      t.integer :chapter_order
      t.text :content
      t.integer :book_id
      t.timestamps
    end
  end
end
