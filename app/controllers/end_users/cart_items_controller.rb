class EndUsers::CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.all
		@item = Item.new
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
		redirect_to end_users_cart_items_path
	end


	def update
	end

	def destroy
	end

	def empty_cart
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:item_id)
	end

end
