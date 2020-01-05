class UseMaterial < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :material

  # priceのバリデーション
  validates :price,
  presence: true                         # 存在している事を検証
  # valueのバリデーション
  validates :value,
  presence: true                         # 存在している事を検証
end
