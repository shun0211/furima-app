class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_card
  
  def show
  end
  
  def verification_address
     @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to purchases_verification_purchases_path(@address)
    else
      render 'verification_address'
    end
  end
  
  def purchases_verification
  end

  def pay
  end

  # def buy     これから実装していきます
  #   @item = Item.find(params[:id])
  #   # すでに購入されていないか？
  #   if @item.buyer.present? 
  #     redirect_to root_path
  #   elsif @card.blank?
  #     # カード情報がなければ、買えないから戻す
  #     redirect_to action: "new"
  #     flash[:alert] = '購入にはクレジットカード登録が必要です'
  #   else
  #     # 購入者もいないし、クレジットカードもあるし、決済処理に移行
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     # 請求を発行
  #     Payjp::Charge.create(
  #     # amount: @item.price,
  #     amount: 1000,
  #     customer: @card.customer_id,
  #     currency: 'jpy',
  #     )
  #     # 売り切れなので、itemの情報をアップデートして売り切れにします。
  #     if @item.update(product_status: 2, buyer_id: current_user.id)
  #       flash[:notice] = '購入しました。'
  #       redirect_to controller: 'purchases', action: 'show', id: @item.id
  #     else
  #       flash[:alert] = '購入に失敗しました。'
  #       redirect_to controller: 'purchases' , action: 'show', id: @item.id
  #     end
  #    end
  #   end

  private
    def set_card
      @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
    end
    
    def address_params
      params.require(:address).permit(:firstname, :familyname, :firstname_kana, :familyname_kana,:id, :postal_code, :prefectures, :municipality, :address, :building_name)
    end
end
