class Item < ApplicationRecord
  has_many :comments
  has_many :pictures
  accepts_nested_attributes_for :pictures
  has_many :item_likes

  belongs_to :user
  belongs_to :category

  has_one :purchase

  scope :category1, -> { where(category_id: 1) }
  scope :category2, -> { where(category_id: 2) }
  scope :category3, -> { where(category_id: 3) }
  scope :category4, -> { where(category_id: 4) }

  scope :includ, -> { includes(:pictures) }

  scope :seigen, -> { limit(10) }

  scope :narabikae, -> { order(id: :desc) }

  scope :recent1, -> { category1.includ.seigen.narabikae }
  scope :recent2, -> { category2.includ.seigen.narabikae }
  scope :recent3, -> { category3.includ.seigen.narabikae }
  scope :recent4, -> { category4.includ.seigen.narabikae }

end
