require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "User CRUD" do
    describe "Sign up" do
      context "Correct input" do
        it "Success" do
          visit signup_path
          fill_in "名前", with: "name"
          fill_in "Eメール", with: "test@example.com"
          fill_in "パスワード", with: "password"
          fill_in "パスワード（確認用）", with: "password"
          click_on "アカウント作成"
          expect(current_path).to eq root_path
        end
      end
      context "No input" do
        it "failure" do
          visit signup_path
          fill_in "名前", with: ""
          fill_in "Eメール", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード（確認用）", with: ""
          click_on "アカウント作成"
          expect(current_path).to eq signup_path
          expect(page).to have_content "Eメールを入力してください"
          expect(page).to have_content "パスワードを入力してください"
          expect(page).to have_content "名前を入力してください"
        end
      end
    end
    describe "Edit user" do
      before { login(user) }
      context "Correct input" do
        it "Success" do
          visit edit_user_path(user)
          fill_in "名前", with: Faker::Lorem.characters(number: 5)
          fill_in "Eメール", with: Faker::Internet.email
          fill_in "自己紹介", with: Faker::Lorem.characters(number: 100)
          fill_in "現在のパスワード (必ず入力してください)", with: user.password
          click_on "アカウント更新"
          expect(current_path).to eq root_path
        end
      end
      context "Forget password" do
        it "failure" do
          visit edit_user_path(user)
          fill_in "名前", with: Faker::Lorem.characters(number: 5)
          fill_in "Eメール", with: Faker::Internet.email
          fill_in "現在のパスワード (必ず入力してください)", with: ""
          click_on "アカウント更新"
          expect(current_path).to eq edit_user_path(user)
          expect(page).to have_content "現在のパスワードを入力してください"
        end
      end
    end
  end
end
