require 'rails_helper'
# product = {name: "Laptop", price: 200000, cover_image: "/home/developer/Downloads/el.jpg", description: "/home/developer/Downloads/el.jpg/home/developer/Downloads/el.jpg",
#  quantity: 22, remaining_products: 0 } 

RSpec.describe Product, type: :model do
  
  describe 'associations' do
    it { should belong_to(:category) }
  end


  it "product Lounched successfully" do 
    user = create(:user)
    image_path = '/home/developer/Downloads/el.jpg'
    cat_image = fixture_file_upload(image_path, 'image/jpg')
    category = build(:category, user: user, cat_image: cat_image)
    product = build(:product,price: 22222, quantity: 20,
                   remaining_products: 0, user: user,
                   category: category, cover_image: cat_image)
    expect(product).to be_valid
  end
end
