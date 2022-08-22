require 'rails_helper'

RSpec.describe Merchant, type: :model do

  describe '#associations' do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
    it { should have_many(:authorize_transactions) }
    it { should have_many(:charge_transactions) }
    it { should have_many(:refund_transactions) }
    it { should have_many(:reverse_transactions) }
  end


  describe '#validations' do
    it { should validate_presence_of(:status) }
  end

  describe '#enums' do
    it { should define_enum_for(:status).with_values([:active, :inactive]) }
  end
end
