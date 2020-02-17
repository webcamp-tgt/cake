class EndUsers::HomesController < ApplicationController
  def top
  	@items = Item.all
  	@genres = Genre.where(is_active: true)
  end

  def about
  end
end
