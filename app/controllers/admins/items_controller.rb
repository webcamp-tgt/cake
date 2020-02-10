class Admins::ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.genre_id = params[:item][:genre_id]
    @item.save!
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
<<<<<<< HEAD

=======
>>>>>>> 655291eb11e76b876d2cdec821443aaf005cf94d
end

