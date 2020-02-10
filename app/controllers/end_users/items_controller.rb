class EndUsers::ItemsController < ApplicationController
	def index
		@items = Item.all
		@genre = Genre.find(params[:genre_id])
	end

	def show
    end
end
