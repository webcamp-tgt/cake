class EndUsers::HomesController < ApplicationController
  def top
  	@items = Item.page(params[:page]).reverse_order
  	@genres =Genre.where(is_active: true)
  end

  def about
  end
end
