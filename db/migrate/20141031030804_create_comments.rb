class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.references :users
      t.string :content
      t.timestamps
    end
  end
end
