class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :email
      t.integer :user_type
      t.string :password_digest
      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end