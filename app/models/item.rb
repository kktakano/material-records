class Item < ApplicationRecord
  belongs_to :user
  has_many :use_materials
  mount_uploader :image, ImageUploader
end
