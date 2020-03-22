class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def verification
  end
  
  def show
    @items = Item.all
  end
  
end
