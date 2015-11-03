class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :category
      t.integer :likes
      t.string :post_type

      t.timestamps null: false
    end
  end
end
