class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "no_of_product", "product_id", "updated_at", "user_id"]
  end
  
end
