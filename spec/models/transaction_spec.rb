require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe '#associations' do
    it { should belong_to(:merchant) }
  end

  describe '#validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:type) }
  end

  describe '#enums' do
    it { should define_enum_for(:status).with_values([:approved, :reversed, :refunded, :error] ) }
  end
end
