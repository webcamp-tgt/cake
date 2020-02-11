class EndUsers::CartItemsController < ApplicationController
	def index
		@cart_items = current_end_user.cart_items
		@cart_item = CartItem.all
		@caet_item = current_end_user
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		redirect_to end_users_cart_items_path
	end


	def update
	end

	def destroy
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end

end
