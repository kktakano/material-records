class MaterialsController < ApplicationController

  def index
    @materials = Material.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(9)
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
      redirect_to new_material_path, notice: '保存できませんでした'
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
      redirect_to edit_material_path, notice: '更新できませんでした'
    end

  end

  def destroy
    product = Material.find(params[:id])
    product.destroy
    redirect_to materials_path, notice: '材料を削除しました'
  end

  private
  def material_params
    params.require(:material).permit(:name,:price,:value,:unit,:image).merge(user_id: current_user.id)
  end
end
