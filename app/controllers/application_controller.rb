class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_top_path
		when EndUser
			end_users_homes_top_path
		end

	end
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		if session[:cart_item_id]
			@cart_item = CartItem.find(session[:cart_item_id])
		else
			@cart_item = CartItem.create
			session[:cart_item_id] = @cart_item.id
		end
	end
end
