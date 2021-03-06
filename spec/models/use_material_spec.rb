require 'rails_helper'

RSpec.describe UseMaterial, type: :model do
  describe '#create' do
    context 'can save' do
      # price, item_id, material_id が存在すれば登録できる
      it 'is valid with a price, user_id, material_id' do
        expect(build(:use_material)).to be_valid
      end
    end
    context 'can not save' do
      # price が空では登録できない
      it 'is invalid without price' do
        use_material = build(:use_material, price: nil)
        use_material.valid?
        expect(use_material.errors[:price]).to include("を入力してください")
      end
      # item_id が空では登録できない
      it 'is invalid without item_id' do
        use_material = build(:use_material, item_id:nil)
        use_material.valid?
        expect(use_material.errors[:item]).to include("を入力してください")
      end
      # material_id が空では登録できない
      it 'is invalid without material_id' do
        use_material = build(:use_material, material_id: nil)
        use_material.valid?
        expect(use_material.errors[:material]).to include("を入力してください")
      end
    end
  end
end