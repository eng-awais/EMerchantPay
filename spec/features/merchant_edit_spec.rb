feature 'Edit merchant by merchant user ' do
  before :each do
    @merchant_user = MerchantUser.create(email: 'test_merchant@gmail.com', password: 'abcd1234@')
    Merchant.create(email: 'merchant_1@gmail.com', status: 0, merchant_user_id: @merchant_user.id)
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: @merchant_user.email
      fill_in 'Password', with: @merchant_user.password
    end
    click_button 'Log in'
  end

  scenario 'cannot see edit button' do
    expect(page).to have_css '.hidden', count: 2
  end

  scenario 'cannot open edit page' do
    find('a', text: /\AEdit\z/).click
    expect(page).to have_content 'You are not authorized to perform this action.'
  end
end

feature 'Edit merchant by admin user ' do
  before :each do
    @merchant_user = MerchantUser.create(email: 'test_merchant@gmail.com', password: 'abcd1234@')
    Merchant.create(email: 'merchant_1@gmail.com', status: 0, merchant_user_id: @merchant_user.id)
    @admin_user = AdminUser.create(email: 'test_admin@gmail.com', password: 'abcd1234@')
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: @admin_user.email
      fill_in 'Password', with: @admin_user.password
    end
    click_button 'Log in'
  end

  scenario 'can see edit button' do
    expect(page).to have_content 'Edit'
  end

  scenario 'can open edit page' do
    find('a', text: /\AEdit\z/).click
    expect(page).to have_content 'Edit Merchant'
  end

  scenario 'can update' do
    find('a', text: /\AEdit\z/).click
    fill_in 'merchant_name', with: 'Test'
    fill_in 'merchant_description', with: 'Test description'
    find("#merchant_status option[value='active']").select_option
    click_button 'Update Merchant'
    expect(page).to have_content 'Successfully updated'
  end
end
