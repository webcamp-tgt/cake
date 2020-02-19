class EndUsers::EndUsersController < ApplicationController
	before_action :authenticate_end_user!
	def show
		@end_user = EndUser.find(params[:id])
		@end_user.id = current_end_user.id
	end
	def edit
		@end_user = EndUser.find(params[:id])
	end
	def update
		@end_user = EndUser.find(params[:id])
		if
		@end_user.update(end_user_params)
		flash[:notice] ="※※※登録情報を変更しました※※※"
		redirect_to end_users_end_user_path(@end_user.id)
		else
		flash[:notice] ="※※※入力内容に誤りがあります※※※"
		render :edit
		end
	end
	def destroy
		end_user = EndUser.find(params[:id])
		end_user.soft_delete
		redirect_to end_users_homes_top_path
	end

	private
	def end_user_params
		params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :email)
	end
end
