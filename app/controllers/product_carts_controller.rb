class ProductCartsController < ApplicationController
  def update
    # when the request is triggered, we find the product_cart by the params[:id]
    @product_cart = ProductCart.find params[:id]
    # then, we check the new quantity
    new_quantity = @product_cart.quantity + params[:offset].to_i
    # we update the quantity
    @product_cart.update quantity: new_quantity

    # Then, we render the html partial -> app/views/shopping_cart/_product_card.html.erb
    render(
      partial: 'shopping_cart/product_card',
      locals: { product_cart: @product_cart },
      formats: [ :html ]
    )
  end

  def destroy
    @product_cart = ProductCart.find params[:id]
    @product_cart.destroy
    head :no_content
  end
end
