class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.integer :category_id
      t.string :media_img
      t.string :media_vid
      t.text :content

      t.timestamps
    end
  end
end
