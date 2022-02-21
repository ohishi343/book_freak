require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  before { login(user) }
  describe "Post CRUD", js: true do
    describe "Create a post" do
      context "Correct input" do
        it "Success" do
          visit new_post_path
          fill_in "著者", with: Faker::Lorem.characters(number: 5)
          fill_in "タイトル", with: Faker::Lorem.characters(number: 10)
          fill_in "書評", with: Faker::Lorem.characters(number: 100)
          find('#star').find("img[alt='5']").click
          click_button "登録"
          expect(current_path).to eq post_path
        end
      end
      context "Incorrect input" do
        it "Failure" do
          visit new_post_path
          fill_in "著者", with: ""
          fill_in "タイトル", with: ""
          fill_in "書評", with: ""
          click_button "登録"
          expect(current_path).to eq new_post_path
        end
      end
    end
  end
  describe "Search posts" do
    let(:post) { create(:post) }
    it "Search a post by title" do
      visit root_path
      fill_in "q_author_or_title_or_body_cont", with: post.title
      click_on "検索"
      expect(page).to have_content "検索結果"
      expect(page).to have_content post.title
    end
  end
end
