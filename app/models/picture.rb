class Picture < ApplicationRecord
  belongs_to :item, optional: true
  # バリデーションがうまくいかないため一旦コメントアウト
  # validates :name, :item_id, presence: true

  mount_uploader :name, ImageUploader
  
end