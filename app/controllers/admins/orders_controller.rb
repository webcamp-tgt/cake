class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = order.find(params[:id])
  	
  end
end

