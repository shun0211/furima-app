require 'rails_helper'
describe Address do
  describe '#create' do
    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include("can't be blank")
    end

    it "familynameがない場合は登録できないこと"do
      address = build(:address, familyname: "")
      address.valid?
      expect(address.errors[:familyname]).to include("can't be blank")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      address = build(:address, firstname_kana: "")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("can't be blank")
    end

    it "firstname_kanaにカタカナ以外がある場合は登録できないこと " do
      address = build(:user, firstname_kana: "カナa")
      address.valid?
      expect(address.errors[:firstname_kana][0]).to include("is invalid")
    end

    it "familyname_kanaがない場合は登録できないこと" do
      address = build(:address, familyname_kana: "")
      address.valid?
      expect(address.errors[:familyname_kana]).to include("can't be blank")
    end

    it "familyname_kanaにカタカナ以外がある場合は登録できないこと " do
      address = build(:address, familyname_kana: "カナa")
      address.valid?
      expect(address.errors[:familyname_kana][0]).to include("全角カタカナのみで入力して下さい")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    it "postal_codeにハイフンがあり7桁であれば登録できること" do
      address = build(:address, postal_code: "1234567")
      address.valid?
      expect(address.errors[:postal_code]).to include("is invalid")
    end

    it "prefecturesがない場合は登録できないこと" do
      address = build(:address, prefectures: "")
      address.valid?
      expect(address.errors[:prefectures]).to include("can't be blank")
    end

    it "municipalityがない場合は登録できないこと" do
      address = build(:address, municipality: "")
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end

    it "addressがない場合は登録できないこと" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end
  end
end
