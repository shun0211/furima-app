class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # Buildメソッドを用いて@itemにproduct_imageの情報を入れることのできるインスタンスを生成
    5.times{
      @item.product_image.build
    }
  end
  
  def create
    Item.create!(item_params)
    redirect_to verification_items_path
  end

  def verification
  end
  
  def show
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
      :prefecture_id,
      :days_of_ship, 
      :brand,
      :size,
      # :category_id,
      # attributesを用いてparamsの中にproduct_imageの情報が入ることを許可
      product_image_attributes: [:id, 
                                 :image,
                                 :item],)
      # ).merge(seller_id: current_user.id)
  end
end
