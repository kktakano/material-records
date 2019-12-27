class MaterialsController < ApplicationController

  def index
    @materials = Material.where(user_id: current_user.id).order('created_at DESC')
    # binding.pry
  end

  def new
    @material = Material.new
  end

  def create
    # binding.pry
    @material = Material.new(material_params)
    if @material.save
      redirect_to materials_path, notice: '材料を登録しました'
    else
      render :new
    end
  end

  # def search
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    material = Material.find(params[:id])
    if material.update(material_params)
      redirect_to materials_path, notice: '材料を編集しました'
    else
      render :edit
    end

  end

  def destroy
    product = Material.find(params[:id])
    # product.destroy if product.user.id == current_user.id
    product.destroy
    redirect_to materials_path, notice: '材料を削除しました'
  end

  private
  def material_params
    params.require(:material).permit(:name,:price,:value,:unit,:image).merge(user_id: current_user.id)
  end
end
