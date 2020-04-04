require 'rails_helper'
describe Item do
  describe '#create' do
    it "商品名（product_name）がない場合は登録できないこと" do
      item = Item.new(product_name: "", product_information: "test", product_status: 1, price: 2000, product_condition: 1, shipping_charge: 1, days_of_ship: 1, prefecture_id: 1, )
      item.valid?
      expect(item.errors[:product_name]).to include("can't be blank")
    end

    # ここからはfactory_botを使用
    it "商品詳細（product_information）がない場合は登録できないこと" do
      item = build(:item, product_information: "")
      item.valid?
      expect(item.errors[:product_information]).to include("can't be blank")
    end

    it "販売価格（price）がない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "商品状態（product_condition）がない場合は登録できないこと" do
      item = build(:item, product_condition: "")
      item.valid?
      expect(item.errors[:product_condition]).to include("can't be blank")
    end

    it "配送料の負担（shipping_charge）がない場合は登録できないこと" do
      item = build(:item, shipping_charge: "")
      item.valid?
      expect(item.errors[:shipping_charge]).to include("can't be blank")
    end

    it "配送までの日数（days_of_ship）がない場合は登録できないこと" do
      item = build(:item, days_of_ship: "")
      item.valid?
      expect(item.errors[:days_of_ship]).to include("can't be blank")
    end

    it "配送元の地域（prefecture_id）がない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "販売価格（price）が数字以外の場合は登録できないこと" do
      item = build(:item, price: "文字列")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end
    
    it "商品名（product_name）が40文字以上の場合は登録ができないこと" do
      item = build(:item, product_name: "a" * 41)
      item.valid?
      expect(item.errors[:product_name]).to include("is too long (maximum is 40 characters)")
    end
    
    it "商品詳細（product_information）が1000文字の場合は登録ができないこと" do
      item = build(:item, product_information: "a" * 1001)
      item.valid?
      expect(item.errors[:product_information]).to include("is too long (maximum is 1000 characters)")
    end

    it "販売価格（price）が300円未満の場合は登録できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "販売価格が（price）が10000000円以上の場合は登録できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999") 
    end

    it "販売価格（price）が300円以上の場合は登録できること" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end

    it "販売価格（price）が9999999円以下の場合は登録できること" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end

    it "商品名（product_name）が40字以下であれば登録できること" do
      item = build(:item, product_name: "a" * 40)
      expect(item).to be_valid
    end

    it "商品詳細（product_information）が1000文字以下であれば登録できること" do
      item = build(:item, product_information: "a" * 1000)
      expect(item).to be_valid
    end
    
  end
end