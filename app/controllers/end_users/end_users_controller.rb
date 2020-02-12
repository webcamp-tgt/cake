class EndUsers::EndUsersController < ApplicationController

	def show
	    @end_user = EndUser.find(params[:id])
	    # @end_user.id = current_user.id
	end
end
