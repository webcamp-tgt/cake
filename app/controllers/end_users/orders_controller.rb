class EndUsers::OrdersController < ApplicationController
    def new
    	@order = Order.new
    end

    def create
    	# 注文処理
    	redirect_to end_users_orders_thanks_path
    end
# ここまで
    def index
        @orders = Order.all
    end

    def show
    	@order = Order.find(params[:id])
    	@order.end_user_id = current_user.id

    	@claim_total = @order.total_amount + @order.shipping_cost
    	@subtotal = @order.order_item.price_tax * @order.order_item.order_quantity
    end

    def confirm
    	@order = Order.new(order_params)
    	@order.payment_method = params[:order][:payment_method].to_i
    	if params[:adress_select] == "1"
    		# 自分の住所
    	elsif params[:adress_select] == "2"
    		# セレクトで選んだ住所
    	else
    		# フォームに書いた住所
    	end
    end

    def thanks
    end

    private
    def order_params
    	params.require(:order).permit(:zip_code,:address,:order_name)
    end



end
