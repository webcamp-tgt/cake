class Admins::OrdersController < ApplicationController
def index
   @orders = Order.all
 end

 def show
   @order = Order.find(params[:id])
 end

 def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   @order_item = OrderItem.find(params[:order_item_id])
   @order_item.update(order_item_params)
   redirect_to admins_orders_path(@order)
 end

 private
 def order_params
  params.require(:order).permit(:order_status)
end
end