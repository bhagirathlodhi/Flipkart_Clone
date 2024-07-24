class ToAddReferenceToProductsWithSubCategory < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :sub_category, foreign_key: true
  end
end
