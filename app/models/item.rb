class Item < ApplicationRecord
  belongs_to :user
  has_many :use_materials
end
