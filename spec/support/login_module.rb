module LoginModule
  def login(user)
    visit login_path
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
end
