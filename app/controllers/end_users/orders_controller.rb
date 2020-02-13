class EndUsers::OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def show
    	@order = Order.find(params[:id])
    	@order.end_user_id = current_user.id

    	@claim_total = @order.total_amount + @order.shipping_cost
    	@subtotal = @order.order_item.price_tax * @order.order_item.order_quantity
    end



end
