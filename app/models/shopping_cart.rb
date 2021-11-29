class ShoppingCart < ApplicationRecord
  has_many :product_carts, dependent: :destroy
  has_many :meals, through: :product_carts
  has_many :restaurants, through: :meals

  def restaurant
    restaurants.first
  end
end
