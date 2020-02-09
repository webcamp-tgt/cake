class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to admins_genres_path
	end

	def edit
	end

	def update
	end
	private
  def genre_params
    params.require(:genre).permit(:name, :is_active )
  end
end
