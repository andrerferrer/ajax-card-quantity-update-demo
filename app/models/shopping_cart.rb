class ShoppingCart < ApplicationRecord
  has_many :product_carts, dependent: :destroy
  has_many :meals, through: :product_carts
end
