class UsersController < ApplicationController
require "payjp"
before_action :set_card, only: [:show]

def show
  @user = User.find(params[:id])
end

def new
end

def sms
  @user = User.new
end

def sms_input
  @user = User.new
end

def completed
end

private

def set_card
  @card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
end

end
