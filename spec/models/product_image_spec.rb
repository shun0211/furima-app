require 'rails_helper'

describe ProductImage do
  describe '#create' do
    it "商品の写真（image）がない場合は登録できないこと" do
      product_image = build(:product_image, image: "")
      product_image.valid?
      expect(product_image.errors[:image]).to include("can't be blank")
    end
  end
end