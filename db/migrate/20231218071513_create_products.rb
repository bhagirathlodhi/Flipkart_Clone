class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :cover_image
      t.text :description
      t.integer :quantity
      t.integer :remaining_products
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
