require 'rails_helper'

RSpec.describe MerchantsController, type: :controller do
  let!(:admin_user) { create(:user, type: 'AdminUser') }

  before do
    sign_in admin_user
  end

  describe '#index' do
    let(:merchant_user) { create(:user, type: 'MerchantUser') }
    let!(:merchant) { create(:merchant, merchant_user_id: merchant_user.id) }

    context 'when get all merchants' do
      before do
        get :index
      end

      it 'returns all merchants' do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
        expect(assigns(:merchants).count).to eq(1)
      end
    end
  end

  describe '#show' do
    let(:merchant_user) { create(:user, type: 'MerchantUser') }
    let!(:merchant) { create(:merchant, merchant_user_id: merchant_user.id) }

    context 'when get specific merchant' do
      before do
        get :show, params: { id: merchant.id }
      end

      it 'returns one merchant' do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:show)
        expect(assigns(:merchant)).to eq(Merchant.last)
      end
    end
  end

  describe '#update' do
    let(:merchant_user) { create(:user, type: 'MerchantUser') }
    let!(:merchant) { create(:merchant, merchant_user_id: merchant_user.id) }

    context 'when update specific merchant' do
      before do
        patch :update, params: { id: merchant.id, merchant: { name: 'Test Merchant', description: 'Good to go!' } }
      end

      it 'updates the merchant' do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(merchant_path(merchant))
        expect(assigns(:merchant).name).to eq('Test Merchant')
        expect(assigns(:merchant).description).to eq('Good to go!')
      end
    end
  end

  describe '#destroy' do
    let(:merchant_user) { create(:user, type: 'MerchantUser') }
    let!(:merchant) { create(:merchant, merchant_user_id: merchant_user.id) }

    context 'when deletes merchant' do
      before do
        delete :destroy, params: { id: merchant.id }
      end

      it 'deletes the merchant' do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(merchants_path)
        expect(assigns(:merchant)).to eq(merchant)
        expect(Merchant.count).to eq(0)
      end
    end
  end
end
