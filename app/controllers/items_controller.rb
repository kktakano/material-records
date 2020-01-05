class ItemsController < ApplicationController
  def index
    @items = Item.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(9)
  end

  def new
    @item = Item.new
    @item.use_materials.build
    @materials = Material.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(9)
    # binding.pry
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    # @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @materials = Material.where('name LIKE(?)', "%#{params[:keyword]}%").where(user_id: current_user.id).order('created_at DESC')
    respond_to do |format|
      format.html
      format.json
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
    params.require(:item).permit(:name, :price, :cost, :image, use_materials_attributes:[:material_id,:price]).merge(user_id: current_user.id)
  end
end
