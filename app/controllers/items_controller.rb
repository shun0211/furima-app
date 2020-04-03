class ItemsController < ApplicationController
  def index
  end

  def new

  end

  def create

  end

  def verification
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.product_images
    @image = @images.first #保存した画像の1番目を表示するためのインスタンス変数

  end

  def edit
  end

  def destroy
  end



end
