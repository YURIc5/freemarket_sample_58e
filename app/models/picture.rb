class Picture < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  mount_uploader :name, ImageUploader
end