class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :postcode , presence: true ,format:{with:/\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id  , presence: true ,inclusion: 1..47
  validates :city           , presence: true , format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :block          , presence: true 
  validates :building       ,length:{maximum: 100}
end
