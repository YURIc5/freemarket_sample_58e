require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end
    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end
    it "is invalid without a day" do
      item = build(:item, day: "")
      item.valid?
      expect(item.errors[:day]).to include("を入力してください")
    end
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end
    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end
    it "is invalid without a delivery_id" do
      item = build(:item, delivery_id: "")
      item.valid?
      expect(item.errors[:delivery_id]).to include("を入力してください")
    end
  end
end