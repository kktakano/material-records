class Item < ApplicationRecord
  belongs_to :user
  has_many :use_materials, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :use_materials, allow_destroy: true
  
  # nameのバリデーション
  validates :name,
    presence: true                         # 存在している事を検証
  # costのバリデーション
  validates :cost,
    presence: true                         # 存在している事を検証
end
