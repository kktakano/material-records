require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      # name, price, cost, user_id が存在すれば登録できる
      it 'is valid with a name, price, cost, user_id' do
        expect(build(:item)).to be_valid
      end
      # name, cost, user_id が存在すれば登録できる
      it 'is valid with a name, cost, user_id' do
        expect(build(:item, price: nil)).to be_valid
      end
    end
    context 'can not save' do
      # name が空では登録できない
      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end
      # cost が空では登録できない
      it 'is invalid without cost' do
        item = build(:item, cost: nil)
        item.valid?
        expect(item.errors[:cost]).to include("を入力してください")
      end
    end
  end
end