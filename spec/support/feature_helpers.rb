module FeatureHelpers
  def sign_in(account)
    visit new_user_session_path

    fill_in 'Email', with: account.email
    fill_in 'Password', with: account.password
    click_on 'Log in'
  end
end
