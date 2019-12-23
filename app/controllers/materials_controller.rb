class MaterialsController < ApplicationController

  def index
    @materials = Material.all.order('created_at DESC')
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

  def edit
    
  end

  def update
    
  end


  def material_params
    params.require(:material).permit(:name,:price,:value,:unit,:image)
  end
end
