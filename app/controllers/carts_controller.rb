class CartsController < ApplicationController
  def show
    @current_cart = current_user.current_cart
  end

  #way too fat!!!
  def checkout
    @current_cart = Cart.find(params[:id])
    @current_cart.status = "submitted"
    @current_cart.save

    @current_cart.line_items.all.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end

    current_user.current_cart = nil

    redirect_to cart_path(@current_cart)
  end
end
