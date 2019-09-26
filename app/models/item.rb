class Item < ApplicationRecord
  has_many :comments
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  has_many :item_likes

  belongs_to :user
  belongs_to :category
  belongs_to :delivery

  has_one :purchase
  accepts_nested_attributes_for :purchase



  enum status:{"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}
  enum size:{"XXS(以下)": 1,"XS(SS)": 2, "S": 3, "M": 4, "L": 5,"XL(LL)": 6, "2XL(3L)": 7, "3XL(4L)": 8, "4XL(5L)以上": 9, "FREE SIZE": 10}

  


  scope :category1, -> { where(category_id: 14..85) }
  scope :category2, -> { where(category_id: 86..144) }
  scope :category3, -> { where(category_id: 404..435) }
  scope :category4, -> { where(category_id: 301..371) }

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