class ToRenameCatogoryIdToSubCategoryId < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :category_id, :sub_category_id
  end
end
