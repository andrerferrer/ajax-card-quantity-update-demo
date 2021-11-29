class ProductCart < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :meal
end
