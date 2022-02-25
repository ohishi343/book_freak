require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "test validations" do
    subject { post.valid? }

    let(:post) { create(:post) }

    it "is valid if there are author & title & body & star & user_id" do
      is_expected.to eq true
    end

    it "is invalid if there is no author" do
      post.author = ""
      is_expected.to eq false
    end

    it "is invalid if author is too long" do
      post.author = Faker::Lorem.characters(number: 51)
      is_expected.to eq false
    end

    it "is invalid if there is no title" do
      post.title = ""
      is_expected.to eq false
    end

    it "is invalid if title is too long" do
      post.title = Faker::Lorem.characters(number: 101)
      is_expected.to eq false
    end

    it "is invalid if there is no body" do
      post.body = ""
      is_expected.to eq false
    end

    it "is invalid if body is too long" do
      post.body = Faker::Lorem.characters(number: 10001)
      is_expected.to eq false
    end

    it "is invalid if there is no star" do
      post.star = ""
      is_expected.to eq false
    end

    it "is invalid if there is no user_id" do
      post.user_id = ""
      is_expected.to eq false
    end
  end

  describe "#favorited_by?(user)" do
    subject { post.favorited_by?(user) }

    let!(:user) { create(:user) }
    let!(:post) { create(:post) }

    context "the favorite exists" do
      let!(:favorite) { create(:favorite, user: user, post: post) }

      it { is_expected.to eq true }
    end

    context "the favorite doesn't exist" do
      let!(:favorite) { create(:favorite) }

      it { is_expected.to eq false }
    end
  end
end
