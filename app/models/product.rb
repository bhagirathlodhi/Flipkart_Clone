class Product < ApplicationRecord
  searchkick word_start: [:name]
  belongs_to :sub_category
  belongs_to :category
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :cover_image
  

  validates :name, presence: true
  validates :price, presence: true
  validates :cover_image, presence: true
  

  after_save :reindex_product

  def search_data
    {
      name: name,
      price: price,
      sub_category_id: sub_category.id,
      category_id: sub_category.category_id # Assuming sub_category belongs_to category
    }
  end

  private

  def reindex_product
    reindex
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