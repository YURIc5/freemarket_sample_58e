require 'rails_helper'
describe Address do
  describe '#create' do
    it "全てが入っていれば登録できる" do
      user    =  build(:user)
      address = build(:address)
      expect(address).to be_valid
    end
 
    it "postcordが空の時は登録できない" do
      address = build(:address, postcord: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end

    it "prefecture_idが空の時は登録できない " do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end
 
    it "cityが空の時は登録できない" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "blockが空の時は登録できない " do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end
 
    it "user_idが空の時は登録できない" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end
 
    it "ハイフンの無いpost_numberは登録できない" do
      address = build(:address, postcord: "2222222")
      address.valid?
      expect(address.errors[:postcord]).to include("不正な郵便番号です")
    end
 
    it "ハイフンの位置が違うpost_numberは登録できない " do
      address = build(:address, postcord: "1-111111")
      address.valid?
      expect(address.errors[:postcord]).to include("不正な郵便番号です")
    end

    it "prefecture_idが指定以外の数字だと登録できない" do
      address = build(:address, prefecture_id: "48")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("is not included in the list")
    end
  end
end
