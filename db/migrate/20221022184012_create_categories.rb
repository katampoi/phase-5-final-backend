class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.boolean :subscribe
      t.string :category_name

      t.timestamps
    end
  end
end
