class Admins::OrderItemsController < ApplicationController

def update
	@order_item = OrderItem.find(params[:id])
   @order_item.update(order_item_params)
   redirect_to admins_orders_path(@order)
 
end
private
def order_item_params
 params.require(:order_item).permit(:production_status)

end
end

