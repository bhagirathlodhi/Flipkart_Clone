require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "category create and valid" do 
    # user = build(:user)

    it "category valid with all attributes " do
      user = create(:user)
      image_path = '/home/developer/Downloads/el.jpg'
      cat_image = fixture_file_upload(image_path, 'image/jpg')
      category = build(:category, user: user, cat_image: cat_image)
      expect(category).to be_valid
    end
  end
end



