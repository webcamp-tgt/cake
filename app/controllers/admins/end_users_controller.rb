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
		if  params[:status_id] =="1"
			@end_user.deleted_at = nil
			@end_user.update(end_user_params)
			redirect_to admins_end_user_path(@end_user.id)
		else params[:status_id] =="2"
			@end_user.soft_delete
			redirect_to admins_end_users_path
		end
	end

		private 
		def end_user_params
			params.require(:end_user).permit(:first_name, :last_namet, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :menber_status)
		end
	end