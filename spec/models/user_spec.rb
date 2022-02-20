require 'rails_helper'

RSpec.describe User, type: :model do
  describe "test validations" do
    let(:user) { create(:user) }
    subject { user.valid? }

    it "is valid if there are email & password & name" do
      is_expected.to eq true
    end

    it "is invalid if there is no email" do
      user.email = ""
      is_expected.to eq false
    end

    it "is invalid if email is duplicated" do
      expect(build(:user, email: user.email)).to_not be_valid
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
      user.name = Faker::Lorem.characters(number:31)
      is_expected.to eq false
    end

    it "is invalid if profile is too long" do
      user.profile = Faker::Lorem.characters(number:201)
      is_expected.to eq false
    end
  end
  describe "#favorite_find(post_id)" do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:favorite) { create(:favorite, user_id: user.id, post_id: post.id) }
    subject { user.favorite_find(post_id) }

    context "the favorite exists" do
      post_id = favorite.post_id

      it { is_expected.to eq true }
    end

    context "the favorite doesn't exist" do
      post_id = favorite.post_id + 1

      it { is_expected.to eq false }
    end
  end
end
