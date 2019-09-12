class Item < ApplicationRecord
  has_many :comments
  has_many :pictures
  has_many :item_likes

  belongs_to :user
  belongs_to :category

  has_one :purchase

end