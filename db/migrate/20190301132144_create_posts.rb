class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
        t.text :body
        t.string :image
        t.integer :likes_count, default: 0
        t.integer :comments_count, default: 0
        t.references :user, foreign_key: true
  
        t.timestamps
    end
  end
end
