require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
    end
  end
end