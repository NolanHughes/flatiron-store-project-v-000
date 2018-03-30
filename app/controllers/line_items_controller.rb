class LineItemsController < ApplicationController
  def create
    current_user.current_cart ||= Cart.new(user_id: current_user.id)
    current_user.current_cart.add_item(params[:item_id])
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
end
