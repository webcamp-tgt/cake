class EndUsers::CartItemsController < ApplicationController
	def index
		@cart_items = current_end_user.cart_items
	end

	def create
		if @cart_item.blank?
			@cart_item = current_caet.cart_item.build(item_id: params[:item_id])
		end

		@cart_item.quantity += params[:quantity].to_i
		@cart_item.save
		redirect_to current_cart
	end

	  # カート詳細画面から、「更新」を押した時のアクション
	  def update
	  	@cart_item.update(quantity: params[:quantity].to_i)
	  	redirect_to current_cart
	  end

	　# カート詳細画面から、「削除」を押した時のアクション
	def destroy
		@cart_item.destroy
		redirect_to current_cart
	end

	private

	def setup_cart_item!
		@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
	end
end
