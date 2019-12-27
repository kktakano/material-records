class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @materials = Material.where(user_id: current_user.id).order('created_at DESC')
    30.times{@item.use_materials.build}
    # binding.pry
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    # @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @materials = Material.where('name LIKE(?)', "%#{params[:keyword]}%").where(user_id: current_user.id)
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
    params.require(:item).permit(:name, :price, :cost, :image).merge(user_id: current_user.id)
  end
end
