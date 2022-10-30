class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :profile_pic
      t.string :bio

      t.timestamps
    end
  end
end
