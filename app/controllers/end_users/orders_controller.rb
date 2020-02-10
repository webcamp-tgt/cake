class EndUsers::OrdersController < ApplicationController


	def index
		@order = Order.new
		@orders = Order.all
	end

	def create
		@order = Order.new(order_params)
		@order.end_user_id = params[:end_user_id]
		@order.save!
		redirect_to end_users_orders_path
	end


    def edit
    	@order = Order.find(params[:id])
    	if @order.end_user_id != current_user.id
    		redirect_to end_users_orders_path
    	end
    end

    def update
    	@order = Order.find(params[:id])
    	@order.end_user_id = current_user.id
    	@order.update(order_params)
    end

    def destroy
    	order = Order.find(params[:id])
    	order.destroy
    	redirect_to end_users_orders_path
    end

    private
    def order_params
    	params.require(:order).permit(:zip_code,:address,:order_name)
    end
end
