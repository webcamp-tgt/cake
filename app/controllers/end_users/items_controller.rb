class EndUsers::ItemsController < ApplicationController
	def index
		@items = Item.all
		@genre = Genre.find(params[:genre_id])
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
	end

	# def create
	# 	@cart_item = CartItem.new(cart_item_params)
	# 	@cart_item.save
	# 	redirect_to end_users_cart_items_path
	# end

	# private
	# def cart_item_params
	# 	params.require(:cart_item).permit(:quantity)
	# end
end
