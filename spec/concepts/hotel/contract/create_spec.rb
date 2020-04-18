require 'rails_helper'

describe Hotel::Contract::Create do
  subject { described_class.new(::Hotel.new).validate(params) }
  let(:contract) { described_class.new(::Hotel.new).call(params) }

  describe '#title' do
    context 'when empty' do
      let(:params) { { title: '', address: 'Address' } }

      it { is_expected.to be_falsey }

      it 'has corresponding error message' do
        expect(contract.errors.messages[:title]).to  eq ["must be filled", "must be unique"]
      end
    end

    context 'when not unique' do
      before { ::Hotel.create!(title: 'Title', address: 'Address') }
      let(:params) { { title: 'Title', address: 'Address' } }

      it { is_expected.to be_falsey }

      it 'has corresponding error message' do
        expect(contract.errors.messages[:title]).to  eq ["must be unique"]
      end
    end
  end

  describe '#address' do
    context 'when empty' do
      let(:params) { { title: 'Title', address: '' } }

      it { is_expected.to be_falsey }

      it 'has corresponding error message' do
        expect(contract.errors.messages[:address]).to  eq ["must be filled"]
      end
    end
  end

  describe '#rating' do
    context 'when greater than or equal to 0' do
      let(:params) { { title: 'Title', address: 'Address', rating: -1 } }

      it { is_expected.to be_falsey }

      it 'has corresponding error message' do
        expect(contract.errors.messages[:rating]).to  eq ["must be greater than or equal to 0"]
      end
    end
  end

  describe '#rating' do
    context 'when less than or equal to 5' do
      let(:params) { { title: 'Title', address: 'Address', rating: 6 } }

      it 'is not valid' do
        is_expected.to be_falsey
      end

      it 'has corresponding error message' do
        expect(contract.errors.messages[:rating]).to  eq ["must be less than or equal to 5", "must be greater than or equal to 0"]
      end
    end
  end
end
