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
      
    end
  end
end