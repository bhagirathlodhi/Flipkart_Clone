
# create_table "sub_categories", force: :cascade do |t|
#   t.string "title"
#   t.integer "category_id", null: false
#   t.integer "user_id", null: false
#   t.string "images"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["category_id"], name: "index_sub_categories_on_category_id"
#   t.index ["user_id"], name: "index_sub_categories_on_user_id"
# end

class SubCategory < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  belongs_to :user
  has_many :products

  validates :title, presence: true
  validates :images, presence: true
end
