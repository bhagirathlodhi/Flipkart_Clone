class Category < ApplicationRecord
  has_one_attached :cat_image
  has_many :products , dependent: :destroy
  belongs_to :user

  validates :cat_image, presence: true
  validates :name, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["cat_image", "created_at", "id", "id_value", "name", "updated_at", "user_id"]
  end
end
