class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :items
    has_many :comments
    has_many :evaluations
    has_many :purchases
    has_many :item_likes
    has_one :address
    has_one :creditcard
  
    def self.find_for_oauth(auth)
      #登録済みのUserか確認
      user = User.where(uid: auth.uid, provider: auth.provider).first
      #登録済みのUserではなかった場合
      unless user
        user = {
          uid:          auth.uid,
          provider:     auth.provider,
          email:        auth.info.email,
          name:         auth.info.name,
          password:     Devise.friendly_token[0, 20]
        }
      end
      user
    end

end

