require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:merchant_user) }
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:authorize_transactions) }
    it { is_expected.to have_many(:charge_transactions) }
    it { is_expected.to have_many(:refund_transactions) }
    it { is_expected.to have_many(:reverse_transactions) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:status) }
  end

  describe '#enums' do
    it { is_expected.to define_enum_for(:status).with_values(%i[active inactive]) }
  end
end
