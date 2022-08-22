require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#associations' do
    it { should have_one(:merchant) }
  end

  describe '#validations' do
    it { should validate_presence_of(:email) }
  end

  describe '#enums' do
    it { should define_enum_for(:role).with_values([:admin, :merchant] ) }
  end

  describe 'creating user' do
    context 'user merchant should valid' do
      let(:merchant_user) { FactoryBot.create(:user, :merchant) }
      it { expect(merchant_user).to be_valid  }
    end

    context 'user admin should valid' do
      let(:admin_user) { FactoryBot.create(:user, :admin) }
      it { expect(admin_user).to be_valid  }
    end

    context 'should raise an argument error' do
      it 'should validate role' do
        expect{ build(:user, :invalid_role) }.to raise_error(ArgumentError)
      end
    end

  end
end
