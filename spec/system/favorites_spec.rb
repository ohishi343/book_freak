require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  describe "Favorites index" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:post) { create(:post, user_id: other_user.id) }
    let!(:favorite) { create(:favorite, user_id: user.id, post_id: post.id) }

    before { login(user) }

    it "Show the post in list of favorites" do
      visit user_path(user)
      expect(page).to have_content post.title
    end
  end
end
