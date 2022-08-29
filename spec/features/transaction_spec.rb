feature 'Transaction data ' do
  before :each do
    @merchant_user_1 = MerchantUser.create(email: 'test_merchant_1@gmail.com', password: 'abcd1234@')
    @mu1_merchant1 = Merchant.create!(email: 'merchant_1@gmail.com', status: 0, merchant_user_id: @merchant_user_1.id)
    @mu1_merchant1.charge_transactions.create(amount: 12000, status: 0, customer_email: 'awais@test.com')
    @mu1_merchant1.charge_transactions.create(amount: 9000, status: 0, customer_email: 'awais12@test.com')
    @mu1_merchant1.charge_transactions.create(amount: 8000, status: 0, customer_email: 'awais12@test.com')
    Merchant.create(email: 'merchant_2@gmail.com', status: 1, merchant_user_id: @merchant_user_1.id)
    @mu1_merchant2 = Merchant.create(email: 'merchant_3@gmail.com', status: 0, merchant_user_id: @merchant_user_1.id)
    @mu1_merchant2.charge_transactions.create(amount: 9000, status: 0, customer_email: 'awais@test.com')
    @mu1_merchant2.charge_transactions.create(amount: 2000, status: 0, customer_email: 'awais@test.com')
    @mu1_merchant2.charge_transactions.create(amount: 1000, status: 0, customer_email: 'awais122@test.com')

    @merchant_user_2 = MerchantUser.create(email: 'test_merchant_2@gmail.com', password: 'abcd1234@')
    @mu2_merchant1 = Merchant.create(email: 'merchant_4@gmail.com', status: 0, merchant_user_id: @merchant_user_2.id)
    @mu2_merchant1.charge_transactions.create(amount: 9000, status: 0, customer_email: 'awais@test.com')
    @mu2_merchant1.charge_transactions.create(amount: 2000, status: 0, customer_email: 'awais@test.com')
    @mu2_merchant1.charge_transactions.create(amount: 1000, status: 0, customer_email: 'awais122@test.com')
    Merchant.create(email: 'merchant_5@gmail.com', status: 0, merchant_user_id: @merchant_user_2.id)
    Merchant.create(email: 'merchant_6@gmail.com', status: 0, merchant_user_id: @merchant_user_2.id)
    @admin_user = AdminUser.create(email: 'test_admin@gmail.com', password: 'abcd1234@')
  end

  scenario 'merchant user cannot see other merchant users merchant transactions' do
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: @merchant_user_1.email
      fill_in 'Password', with: @merchant_user_1.password
    end
    click_button 'Log in'
    visit "/merchants/#{@mu2_merchant1.id}/transactions"

    expect(page).to have_content 'You are not authorized to perform this action.'
  end

  scenario 'admin can access all merchants transactions' do
    visit '/users/sign_in'
    within('#session') do
      fill_in 'Email', with: @admin_user.email
      fill_in 'Password', with: @admin_user.password
    end
    click_button 'Log in'
    visit "/merchants/#{@mu1_merchant1.id}/transactions"

    expect(page).to have_content "Merchant #{@mu1_merchant1.email} Transactions"
  end

end
