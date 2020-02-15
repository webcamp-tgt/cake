class EndUsers::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
		redirect_to end_users_cart_items_path
	end

	def index
		@cart_items = CartItem.all
		@order_item = OrderItem.new
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to end_users_cart_items_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to end_users_cart_items_path
	end

	def empty_cart
		cart_item = CartItem.all
		cart_item.destroy
		redirect_to end_users_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:item_id)
	end

end
