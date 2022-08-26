require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let!(:admin_user) { create(:user, type: 'AdminUser') }

  before do
    sign_in admin_user
  end

  describe '#index' do
    context 'when get all merchants' do
      let(:merchant_user) { create(:user, type: 'MerchantUser') }
      let(:merchant) { create(:merchant, merchant_user_id: merchant_user.id) }
      let!(:transactions) { create_list(:transaction, 3, merchant: merchant) }

      before do
        get :index, params: { merchant_id: merchant.id }
      end

      it 'returns all transactions for specific merchant' do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
        expect(assigns(:transactions).count).to eq(3)
      end
    end
  end
end
