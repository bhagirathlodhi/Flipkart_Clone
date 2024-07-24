FactoryBot.define do
  factory :category do
    name { "Sports" }
    cat_image {'/home/developer/Downloads/el.jpg' }

  end
end


# create_table "categories", force: :cascade do |t|
#   t.string "name"
#   t.string "cat_image"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id"
#   t.index ["user_id"], name: "index_categories_on_user_id"
# end