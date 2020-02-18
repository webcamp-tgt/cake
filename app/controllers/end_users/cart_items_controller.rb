class EndUsers::CartItemsController < ApplicationController
	before_action :authenticate_end_user!

	def create
		if end_user_signed_in?
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
		redirect_to end_users_cart_items_path
		else
		redirect_to root_path
	end
	end

	def index
		@order_item = OrderItem.new
		@cart_items = current_end_user.cart_items
		@sum = 0
		@cart_items.each do |cart_item|
			@sum += cart_item.item.price * cart_item.quantity
		end

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
		cart_items = CartItem.all
		current_end_user.cart_items.destroy_all
		redirect_to end_users_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:item_id)
	end

end
