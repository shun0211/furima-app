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

  private
    def set_card
      @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
    end
    
    def address_params
      params.require(:address).permit(:firstname, :familyname, :firstname_kana, :familyname_kana,:id, :postal_code, :prefectures, :municipality, :address, :building_name)
    end
end
