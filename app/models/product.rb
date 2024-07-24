class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :cover_image

  validates :name, presence: true
  validates :price, presence: true
  validates :cover_image, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "cover_image", "created_at", "description", "id", "id_value", "name", "price", "quantity", "remaining_products", "updated_at", "user_id"]
  end
end


# class User < ApplicationRecord
#   has_many :bookings, dependent: :destroy
#   has_many :products, through: :bookings
# end

# class Product < ApplicationRecord
#   belongs_to :category
#   has_many :bookings, dependent: :destroy
#   has_many :users, through: :bookings
# end

# class Booking < ApplicationRecord
#   belongs_to :user
#   belongs_to :product
# end

# class Category < ApplicationRecord
#   has_one_attached :cat_image
#   has_many :products , dependent: :destroy
#   belongs_to :user