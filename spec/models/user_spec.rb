require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "nicknameが26文字以上だと登録不可" do
      user = build(:user, nickname: "a" * 26, email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long (maximum is 25 characters)")
    end
    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが重複すると登録不可" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank", "is too short (minimum is 7 characters)")
    end
    it "passwordが7文字未満だと登録不可" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short (minimum is 7 characters)")
    end
    it "passwordが21文字以上だと登録不可" do
      user = build(:user, password: "1" * 21)
      user.valid?
      expect(user.errors[:password][0]).to include("is too long (maximum is 20 characters)")
    end
    it "firstnameが空だと登録不可" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end
    it "firstnameが11文字以上だと登録不可" do
      user = build(:user, firstname: "亜" * 11 )
      user.valid?
      expect(user.errors[:firstname][0]).to include("is too long (maximum is 10 characters)")
    end
    it "firstnameに漢字以外が含まれると登録不可 " do
      user = build(:user, firstname: "亜亜a")
      user.valid?
      expect(user.errors[:firstname][0]).to include("is invalid")
    end
    it "familynameが空だと登録不可" do
      user = build(:user, familyname: nil)
      user.valid?
      expect(user.errors[:familyname]).to include("can't be blank")
    end
    it "familynameが11文字以上だと登録不可" do
      user = build(:user, familyname: "亜" * 11 )
      user.valid?
      expect(user.errors[:familyname][0]).to include("is too long (maximum is 10 characters)")
    end
    it "familynameに漢字以外が含まれると登録不可 " do
      user = build(:user, familyname: "亜亜a")
      user.valid?
      expect(user.errors[:familyname][0]).to include("is invalid")
    end
    it "firstname_kanaが空だと登録不可" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end
    it "firstname_kanaが16文字以上だと登録不可" do
      user = build(:user, firstname_kana: "ア" * 16)
      user.valid?
      expect(user.errors[:firstname_kana][0]).to include("is too long (maximum is 15 characters)")
    end
    it "firstname_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, firstname_kana: "カナa")
      user.valid?
      expect(user.errors[:firstname_kana][0]).to include("is invalid")
    end
    it "familyname_kanaが空だと登録不可" do
      user = build(:user, familyname_kana: nil)
      user.valid?
      expect(user.errors[:familyname_kana]).to include("can't be blank")
    end
    it "familyname_kanaが16文字以上だと登録不可" do
      user = build(:user, familyname_kana: "ア" *16)
      user.valid?
      expect(user.errors[:familyname_kana][0]).to include("is too long (maximum is 15 characters)")
    end
    it "familyname_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, familyname_kana: "カナa")
      user.valid?
      expect(user.errors[:familyname_kana][0]).to include("is invalid")
    end
    it "birth_yearが空だと登録不可" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end
    it "birth_yearが5文字以上だと登録不可" do
      user = build(:user, birth_year: "11111")
      user.valid?
      expect(user.errors[:birth_year][0]).to include("is too long (maximum is 4 characters)")
    end
    it "birth_monthが空だと登録不可" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end
    it "birth_monthが3文字以上だと登録不可" do
      user = build(:user, birth_month: "111")
      user.valid?
      expect(user.errors[:birth_month][0]).to include("is too long (maximum is 2 characters)")
    end
    it "birth_dayが空だと登録不可" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
    it "birth_dayが3文字以上だと登録不可" do
      user = build(:user, birth_day: "111")
      user.valid?
      expect(user.errors[:birth_day][0]).to include("is too long (maximum is 2 characters)")
    end
    it "phone_numberが空だと登録不可" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
    it "phone_numberが12文字以上だと登録不可" do
      user = build(:user, phone_number: "1" * 12)
      user.valid?
      expect(user.errors[:phone_number][0]).to include("is the wrong length (should be 11 characters)")
    end
    it "phone_numberが10以下だと登録不可" do
      user = build(:user, phone_number: "1" * 10)
      user.valid?
      expect(user.errors[:phone_number][0]).to include("is the wrong length (should be 11 characters)")
    end
    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end