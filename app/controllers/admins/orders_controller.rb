class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = order.find(params[:id])
  	
  end
  def update
  	@order =  Order.find(params[:id])
  	@order.update(order_params)
  	@order_item = Order_item.find(params[:id])
  	@order_item.update(order_item_params)
  	redirect_to admins_orders_path(@order)
  end
end

