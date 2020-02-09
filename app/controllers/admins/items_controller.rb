class Admins::ItemsController < ApplicationController
<<<<<<< HEAD
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :genres, :price, :sale_status)
  end
=======
>>>>>>> 1e329200936770b9c2ad613c4baa3af23693b3ab
end

