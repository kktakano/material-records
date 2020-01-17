require 'rails_helper'

RSpec.describe Material, type: :model do
  describe '#create' do
    context 'can save' do
      # 1.name, price, value, unit, user_id が存在すれば登録できる
      it 'is valid with a name, price, value, unit, user_id' do
        expect(build(:material)).to be_valid
      end
    end
    context 'can not save' do
      
    end
  end
end