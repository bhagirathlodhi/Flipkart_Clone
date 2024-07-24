class User < ApplicationRecord

  has_many :products, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :categories, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {customer: 0, seller: 1, admin: 3}
end
