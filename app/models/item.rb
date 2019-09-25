class Item < ApplicationRecord
  has_many :comments
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  has_many :item_likes

  belongs_to :user
  belongs_to :category

  has_one :purchase
  accepts_nested_attributes_for :purchase

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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # バリデーションがうまくいかないため一旦コメントアウト
  # validates :name, presence: true, length: { maximum: 40 }
  # validates :description, presence: true, length: { maximum: 1000 }
  # validates :status, presence: true
  # validates :responsibility, presence: true
  # validates :day, presence: true
  # validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  # validates :category_id, presence: true
  # validates :prefecture_id, presence:true
  # validates :pictures, presence:true

end