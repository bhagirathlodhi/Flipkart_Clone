class CreateSubCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_categories do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :images

      t.timestamps
    end
  end
end
