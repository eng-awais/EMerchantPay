require 'rails_helper'

RSpec.describe MerchantUser, type: :model do

  describe '#associations' do
    it { should have_many(:merchants) }
  end

end
