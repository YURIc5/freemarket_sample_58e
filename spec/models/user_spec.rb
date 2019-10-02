require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname,name,name_kana, email, password, password_confirmation, birthday, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームが空なら登録不可" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "名前が空なら登録不可" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "名前に漢字以外入っていたら登録不可" do
      user = build(:user, name: "亜亜a")
      user.valid?
      expect(user.errors[:name]).to include("is invalid")
    end

    it "名前のカナが空なら登録不可" do
      user = build(:user, name_kana: "")
      user.valid?
      expect(user.errors[:name_kana]).to include("can't be blank")
    end

    it "名前のカナにカタカナ以外が入っていたら登録不可" do
      user = build(:user, name_kana: "カナあ")
      user.valid?
      expect(user.errors[:name_kana]).to include("is invalid")
    end

    it "誕生日が空なら登録不可" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "電話番号が空なら登録不可" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it "電話番号が11文字でなければ登録不可" do
      user = build(:user, phone_number: "0000000")
      user.valid?
      expect(user.errors[:phone_number]).to include("is the wrong length (should be 11 characters)")
    end

    it "emailが空なら登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "既に登録されているemailがあれば登録不可" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it "passwordが空なら登録不可" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが空なら登録不可" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "password_confirmationが空なら登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end
  end
end