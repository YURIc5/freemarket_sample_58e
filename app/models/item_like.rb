class ItemLike < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :evaluation
end
