require 'rails_helper'
describe Item do
  describe '#create' do
    it "商品名（product_name）がない場合は登録できないこと" do
      item = Item.new(product_name: "", product_information: "test", product_status: 1, price: 2000, product_condition: 1, shipping_charge: 1, days_of_ship: 1, prefecture_id: 1, )
      item.valid?
      expect(item.errors[:product_name]).to include("can't be blank")
    end
  end
end