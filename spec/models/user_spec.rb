require 'rails_helper'

RSpec.describe User, type: :model do
  describe "test validations" do
    subject { user.valid? }

    let(:user) { create(:user) }

    it "is valid if there are email & password & name" do
      is_expected.to eq true
    end

    it "is invalid if there is no email" do
      user.email = ""
      is_expected.to eq false
    end

    it "is invalid if email is duplicated" do
      expect(build(:user, email: user.email)).not_to be_valid
    end

    it "is invalid if there is no password" do
      user.password = ""
      is_expected.to eq false
    end

    it "is invalid if there is no name" do
      user.name = ""
      is_expected.to eq false
    end

    it "is invalid if name is too long" do
      user.name = Faker::Lorem.characters(number: 31)
      is_expected.to eq false
    end

    it "is invalid if profile is too long" do
      user.profile = Faker::Lorem.characters(number: 201)
      is_expected.to eq false
    end
  end
end
