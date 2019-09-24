class Picture < ApplicationRecord
  belongs_to :item, optional: true
  # 現在バリデーションがうまく言っていないため一旦コメントアウト
  # validates :name, :item_id, presence: true

  mount_uploader :name, ImageUploader
  
end