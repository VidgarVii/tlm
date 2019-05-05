require 'rails_helper'

feature "home/index", type: :feature do
  given(:user) { create(:user) }

  background do
    sign_in(user)
    visit root_path
  end

  scenario 'user can see page' do
    expect(page).to have_content 'TLM'
  end
end
