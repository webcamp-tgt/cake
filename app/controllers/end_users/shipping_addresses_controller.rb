class EndUsers::ShippingAddressesController < ApplicationController

def index
		@shipping_address = ShippingAddress.new
		@shipping_addresses = ShippingAddress.all
end

def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.end_user_id = current_end_user.id
		@shipping_address.save
		redirect_to end_users_shipping_addresses_path
end

def edit
    	@shipping_address = ShippingAddress.find(params[:id])
end

def update
	@shipping_address = ShippingAddress.find(params[:id])
	@shipping_address.end_user_id = current_end_user.id
	@shipping_address.update(shipping_address_params)
	redirect_to end_users_shipping_addresses_path
end

def destroy
	shipping_address = ShippingAddress.find(params[:id])
	shipping_address.destroy
	redirect_to end_users_shipping_addresses_path
end

private
    def shipping_address_params
    	params.require(:shipping_address).permit(:zip_code,:address,:order_name)
    end

end
