class SubCategory < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  belongs_to :user
  has_many :products
end
