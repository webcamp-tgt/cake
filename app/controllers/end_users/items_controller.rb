class EndUsers::ItemsController < ApplicationController
	def index
		@genres = Genre.where(is_active: true)
		@items = Item.all
	end

	def genre
		@genres = Genre.where(is_active: true)
		@genre = Genre.find(params[:id])
		@items = Item.all
	end

	def show
		@genres = Genre.where(is_active: true)
		@item = Item.find(params[:id])
		@items = Item.all
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
