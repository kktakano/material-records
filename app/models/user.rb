class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :materials
  # nameのバリデーション
  validates :name,
    presence: :true                         # 存在している事を検証
  # e_mailのバリデーション
  validates :e_mail,
    presence: :true,                        # 存在している事を検証
    uniqueness: { case_sensitive: false }   # 一意性制約(大文字と小文字を区別しない)
  # passwordのバリデーション
  validates :password,
    presence: :true,                        # 存在している事を検証
    length: { in: 6..20 }                   # 6文字以上20文字以内
end
