class AddDislikeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :dislike, :integer, default: 0
  end
end
