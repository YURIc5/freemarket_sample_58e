class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :item

  mount_uploader :name, ImageUploader
end