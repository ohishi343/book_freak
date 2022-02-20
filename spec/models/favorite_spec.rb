require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "test validations" do
    let(:favorite) { create(:favorite) }

    it "is valid if there is favorite" do
      expect(favorite).to be_valid
    end

    it "is invalid if duplicated favorites" do
      expect(build(:favorite, post_id: favorite.post_id, user_id: favorite.user_id )).to_not be_valid
    end
  end
end
