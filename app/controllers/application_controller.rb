class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number
)}
	end


	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_top_path
		when EndUser
			end_users_homes_top_path
		end

	end
end
