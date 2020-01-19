class Material < ApplicationRecord
  belongs_to :user
  has_many :use_materials
  has_one_attached :image

  # nameのバリデーション
  validates :name,
  presence: true                         # 存在している事を検証
  # priceのバリデーション
  validates :price,
  presence: true,                         # 存在している事を検証
  length: { maximum: 9 }                  # 0.1〜99999999.9までの入力を許可
  # valueのバリデーション
  validates :value,
  presence: true                         # 存在している事を検証
  # unitのバリデーション
  validates :unit,
  presence: true                         # 存在している事を検証
  # user_idのバリデーション
  validates :user, 
  presence: true                         # 存在している事を検証
end
