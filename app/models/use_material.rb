class UseMaterial < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :material
end
