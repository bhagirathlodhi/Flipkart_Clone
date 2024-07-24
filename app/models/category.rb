class Category < ApplicationRecord
  paginates_per 5
  has_one_attached :cat_image
  # has_many :products , dependent: :destroy
  belongs_to :user
  has_many :sub_categories, dependent: :destroy

  validates :cat_image, presence: true
  validates :name, presence: true

end
