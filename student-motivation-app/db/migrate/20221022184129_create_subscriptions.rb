class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
