class EndUsers::OrdersController < ApplicationController
    def new
    	@order = Order.new
    end

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
    	@address = ShippingAddress.find(params[:order][:address_id])
    	@order = Order.new
    	@order.zip_code = @address.zip_code
    	@order.address = @address.address
    	@order.order_name = @address.order_name
    	@order.payment_method = params[:order][:payment_method].to_i
    	if params[:adress_select] == "1"
    		# 自分の住所
            current_end_user.zip_code
            current_end_user.address
            current_end_user.order_name
    	elsif params[:adress_select] == "2"
    		# セレクトで選んだ住所

    	else
    		# フォームに書いた住所

    	end
    end

    def create
    	# # 注文処理
        #　カートの商品を持ってくる記述を追記
    	@order = Order.new (order_params)
        @order.end_user_id = current_end_user.id
        @order. = current_end_user.cart.items
    	@order.save
    	redirect_to end_users_orders_thanks_path
    end

    def thanks
    end

    private
    def order_params
    	params.require(:order).permit(:zip_code,:address,:order_name,:payment_method)
    end



end
