# require 'rails_helper'
# describe CreditCard do
#   describe '#create' do

#     it "card_numberがない場合は登録できないこと" do
#       credit_card = build(:credit_card, card_number: "")
#       credit_card.valid?
#       expect(credit_card.errors[:card_number]).to include("can't be blank")
#     end

#     it "card_numberが13桁未満の場合は登録できないこと" do
#       credit_card = build(:credit_card, card_number: "1234567890123")
#       credit_card.valid?
#       expect(credit_card.errors[:card_number][0]).to include("is invalid")
#     end

#     it "card_numberが17文字以上の場合は登録できないこと" do
#       credit_card = build(:credit_card, card_number: "12345678901234567")
#       credit_card.valid?
#       expect(credit_card.errors[:card_number][0]).to include("is invalid")
#     end

#     it "card_numberに整数以外の文字がある場合は登録できないこと" do
#       credit_card = build(:credit_card, card_number: "12345678901234ab")
#       credit_card.valid?
#       expect(credit_card.errors[:card_number][0]).to include("is invalid")
#     end

#     it "card_numberが重複している場合は登録できないこと" do
#       create(:credit_card)
#       another_credit_card = build(:credit_card)
#       another_credit_card.valid?
#       expect(another_credit_card.errors[:card_number]).to include("has already been taken")
#     end

#     it "exp_monthがない場合は登録できないこと" do
#       credit_card = build(:credit_card, exp_month: "")
#       credit_card.valid?
#       expect(credit_card.errors[:exp_month]).to include("can't be blank")
#     end

#     it "exp_yearがない場合は登録できないこと" do
#       credit_card = build(:credit_card, exp_year: "")
#       credit_card.valid?
#       expect(credit_card.errors[:exp_year]).to include("can't be blank")
#     end

#     it "cvcがない場合は登録できないこと" do
#       credit_card = build(:credit_card, cvc: "")
#       credit_card.valid?
#       expect(credit_card.errors[:cvc]).to include("can't be blank")
#     end

#     it "cvcが2文字未満の場合は登録できないこと" do
#       credit_card = build(:credit_card, cvc: "12")
#       credit_card.valid?
#       expect(credit_card.errors[:cvc][0]).to include("is invalid")
#     end

#     it "cvcが5文字以上の場合は登録できないこと" do
#       credit_card = build(:credit_card, cvc: "12345")
#       credit_card.valid?
#       expect(credit_card.errors[:cvc][0]).to include("is invalid")
#     end

#     it "cvcが整数以外の場合は登録できないこと" do
#       credit_card = build(:credit_card, cvc: "12a")
#       credit_card.valid?
#       expect(credit_card.errors[:cvc][0]).to include("is invalid")
#     end

#   end
# end









