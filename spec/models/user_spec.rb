require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a name" do
      urer = build(:user, nickname: nil)
      user = User.new(name:"", email:"kkk@gmail.com", password:"00000000", password_confirmation:"00000000")
      user.valid?
      expect(user.errors[:name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
    end
  end
end