require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "Post CRUD", js: true do
    let(:user) { create(:user) }
    before { login(user) }
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
          it "Success" do
            visit new_post_path
            fill_in "著者", with: Faker::Lorem.characters(number: 5)
            fill_in "タイトル", with: Faker::Lorem.characters(number: 10)
            fill_in "書評", with: Faker::Lorem.characters(number: 100)
            find('#star').find("img[alt='5']").click
            click_button "登録"
            expect(current_path).to eq new_post_path
          end
        end
      end
    end
  end
end
