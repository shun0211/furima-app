class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:new, :create]
  before_action :set_card

  def index #CardのデータをPayjpに送って情報を取り出す
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"] #初期化です。
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      # ブランドアイコンを表示するためのコードです。
      @card_brand = @card_information.brand
      
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "SaisonCard"
        @card_src = "saison-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
  end

  def new     # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    @card = CreditCard.where(user_id: current_user.id).first
    #ここはおk
    redirect_to pay_purchase_path(@item.id) if @card.present?
  end

   def create     # PayjpとCardのデータベースを作成
    @address = Address.new
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]

    if params["payjp_token"].blank?
      redirect_to credit_card_path
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        card: params["payjp_token"]     # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def delete     # PayjpとCardのデータベースを削除します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.delete
      redirect_to credit_cards_path(current_user)
    else
      redirect_to root_path(current_user)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
    @images = @item.product_images
    @image = @images.first 
  end

  def set_card
    @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end
end