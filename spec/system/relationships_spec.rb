require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
  end

  describe '#create,#destroy', js: true do
    it 'ユーザーをフォロー、フォロー解除できる' do
      login(@user2)
      visit user_path(@user1)

      click_on 'フォローする'
      expect(page).to have_selector 'フォロー解除'
      expect(@user2.following.count).to eq(1)
      expect(@user1.follower.count).to eq(1)

      click_on 'フォロー解除'
      expect(page).to have_selector 'フォローする'
      expect(@user2.following.count).to eq(0)
      expect(@user1.follower.count).to eq(0)
    end
  end
end
