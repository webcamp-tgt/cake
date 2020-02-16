class Admins::EndUsersController < ApplicationController
	def index
		@end_users = EndUser.all
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user =EndUser.find(params[:id])
	end

	def update
		@end_user =EndUser.find(params[:id])
		@end_user.update(end_user_params)
		redirect_to admins_end_user_path(@end_user.id)
	end

	privates
	def end_user_params
		params.require(:end_user).permit(:first_name, :last_namet, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :menber_status)
	end
end