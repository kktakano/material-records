require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a name" do
      urer = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
    end
  end
end