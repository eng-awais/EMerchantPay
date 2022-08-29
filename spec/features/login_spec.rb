require 'rails_helper'

feature 'Signing in' do
  background do
    MerchantUser.create(email: 'test_merchant@gmail.com', password: 'abcd1234@')
  end

  scenario ' with correct merchant user credentials' do
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: 'test_merchant@gmail.com'
      fill_in 'Password', with: 'abcd1234@'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:admin_user) { AdminUser.create(email: 'test_admin@gmail.com', password: 'abcd1234@') }

  scenario ' as admin user' do
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
