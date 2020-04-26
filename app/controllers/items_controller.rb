class ItemsController < ApplicationController
  # ログイン中のユーザーのみ実行可能にする（トップページと商品詳細ページは除く）
  before_action :authenticate_user!, {only: [:new, :create, :edit, :destroy]}
  before_action :set_item, only:['edit', 'update']

  def index
    @items = Item.limit(3).order('created_at DESC')
  end

  def new
    @item = Item.new
    # カテゴリーの親を取得
    @category = Category.where(ancestry: nil)
    # @itemにproduct_imagesの情報を入れることのできるインスタンスを生成
    @item.product_images.build
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
  
  def get_category_children
    @children = Category.find(params[:parent_category_id]).children
    respond_to do |format|
      format.html
      format.json { render json: @children }
    end
  end

  def get_category_grandchildren
    @grandchildren = Category.find(params[:child_category_id]).children
    respond_to do |format|
      format.html
      format.json { render json: @grandchildren }
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.product_images
    @image = @images.first 
  end

  def edit
    @images = @item.product_images
    @parent_category = @item.category.parent.parent.siblings
    @child_category = @item.category.parent.siblings
    @grandchild_category = @item.category.siblings
  end

  def image_delete
    @image = ProductImage.find(params[:product_image_id])
    @image.destroy
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        @item.valid? 
        format.html { redirect_to root_path }
        format.json { render json: @item.errors.messages }
      else
        @item.valid? 
        format.json { render json: @item.errors.messages }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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
      :category_id,
      # attributesを用いてparamsの中にproduct_imagesの情報が入ることを許可
      product_images_attributes: [:id, 
                                 :image,
                                 :item_id],)
      .merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
