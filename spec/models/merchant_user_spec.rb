require 'rails_helper'

RSpec.describe MerchantUser, type: :model do
  describe '#associations' do
    it { is_expected.to have_many(:merchants) }
  end
end
