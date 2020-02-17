class EndUsers::OrdersController < ApplicationController
    def new
    	@order = Order.new
    end

    def index
        @orders = Order.all
    end

    def show
    	@order = Order.find(params[:id])
    	@order.end_user_id = current_end_user.id
    end

    def confirm
        # address_select　は一時的作成したカラムで、パラメータでデータを送る際に使用。
    	if params[:address_select] == "1"
    		# もし１つ目を選択したら自分の住所
            @order = Order.new
            @order.zip_code = current_end_user.zip_code
            @order.address = current_end_user.address
            @order.order_name = current_end_user.full_name
            @order.payment_method = params[:order][:payment_method].to_i

        elsif params[:address_select] == "2"
    		# もし２つ目を選択したらセレクトで選んだ住所
            @address = ShippingAddress.find(params[:order][:address_id])
            @order = Order.new
            @order.zip_code = @address.zip_code
            @order.address = @address.address
            @order.order_name = @address.order_name
    	    @order.payment_method = params[:order][:payment_method].to_i
        else
    		# もし３つ目を選択したらフォームに書いた住所
            @order = Order.new
    	end
    end

    def create
    	# # 注文処理
    	@order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        current_end_user.cart_items.each do |cart_item|
        # カートアイテムの中身が複数の場合があるのでeach文を使用し全てcreateできるようにする
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item_id
        @order_item.price_tax = cart_item.item.price * 1.1
        @order_item.order_quantity = cart_item.quantity
        end
    	@order.save
        @order_item.order_id = @order.id
        @order_item.save
    	redirect_to end_users_orders_thanks_path
    end

    def thanks
    end

    private
    def order_params
    	params.require(:order).permit(:zip_code,:address,:order_name,:payment_method,:total_amount)
    end




end
