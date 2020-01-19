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
      
    end
  end
end