FactoryBot.define do
  factory :product do
    name { "Bat" }
    price { 500 }
    cover_image { '/home/developer/Downloads/el.jpg' }
    description { " descriptionde scriptiondescriptiondesc riptiondescriptiondesc ription"}
    quantity { 22 }
   
  end
end


# create_table "products", force: :cascade do |t|
#   t.string "name"
#   t.integer "price"
#   t.string "cover_image"
#   t.text "description"
#   t.integer "quantity"
#   t.integer "remaining_products"
#   t.integer "category_id", null: false
#   t.integer "user_id"
# 
# end