require 'rails_helper'

RSpec.describe Material, type: :model do
  describe '#create' do
    context 'can save' do
      # name, price, value, unit, user_id が存在すれば登録できる
      it 'is valid with a name, price, value, unit, user_id' do
        expect(build(:material)).to be_valid
      end
    end
    context 'can not save' do
      # name が空では登録できない
      it 'is invalid without name' do
        material = build(:material, name: nil)
        material.valid?
        expect(material.errors[:name]).to include("を入力してください")
      end
    end
  end
end