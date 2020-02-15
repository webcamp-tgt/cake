class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.genre_id = params[:item][:genre_id]
    @item.save
    redirect_to admins_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :sale_status)
  end
end

