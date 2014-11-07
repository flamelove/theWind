class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references  :user
      t.string :title
      t.text :content
      t.string :slug
      t.timestamps
    end
     add_index :posts, :slug, unique: true
  end
end
