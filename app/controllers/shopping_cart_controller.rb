class ShoppingCartController < ApplicationController
  def show
    @shopping_cart = ShoppingCart.find params[:id]
  end
end
