class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.permit(:name, :image, :stock, :cost)
  end
end
