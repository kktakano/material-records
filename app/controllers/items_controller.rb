class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
end
