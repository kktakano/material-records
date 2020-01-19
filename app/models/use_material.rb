class UseMaterial < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :material

  # priceのバリデーション
  validates :price,
  presence: true                         # 存在している事を検証
  # item_idのバリデーション
  validates :item,
  presence: true                         # 存在している事を検証
  # material_idのバリデーション
  validates :material,
  presence: true                         # 存在している事を検証  
end
