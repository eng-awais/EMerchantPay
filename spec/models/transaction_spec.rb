require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:merchant) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:type) }
  end

  describe '#enums' do
    it { is_expected.to define_enum_for(:status).with_values(%i[approved reversed refunded error]) }
  end
end
