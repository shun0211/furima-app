class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_product_image
  end

  def create
    Item.create(item_params)
    redirect_to verification_items_path
  end

  def verification
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(
      :product_name,
      :product_information,
      :product_status,
      :price,
      :product_condition,
      :shipping_charge,
      :days_of_ship, 
      :brand,
      :size,
      product_image_attributes: [:id, 
                                 :image,
                                 :item_id]
    )
  end
  
end
