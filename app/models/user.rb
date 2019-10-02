class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         kanji = /\A[一-龥]+\z/
         kana = /\A[ァ-ヶー－]+\z/

  has_many :items
    has_many :comments
    has_many :evaluations
    has_many :purchases
    has_many :item_likes
    has_one :address
    has_one :creditcard

  validates :nickname, presence: true
  validates :name, presence: true, format: { with: kanji }
  validates :name_kana, presence: true, format: { with: kana }
  validates :birthday, presence: true,length: { is:8 }
  validates :phone_number, presence: true, length: { is: 11 }
  validates :password_confirmation, presence: true
  
  
    def self.find_for_oauth(auth)
      #登録済みのUserか確認
      user = User.where(uid: auth.uid, provider: auth.provider).first
      #登録済みのUserではなかった場合
      unless user.present?
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return user
    end

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "user_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Item"

 
end
