class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @itemにproduct_imageの情報を入れることのできるインスタンスを5つ生成
    5.times{
      @item.product_image.build
    }
  end
  
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      # バリデーションチェックが通ればフォーム記載内容をデータベースに保存する
      # また、バリデーションチェックした際のエラーメッセージをjson形式にてnew_item.jsへ返す
      if @item.valid? 
        @item.save
        format.html { redirect_to root_path }
        format.json { render json: @item.errors.messages }
      else
        format.json { render json: @item.errors.messages }
      end
    end
  end

  def verification
  end

  def verification_address
  end

  def credit
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
      # .merge(seller_id: current_user.id)
  end
end
