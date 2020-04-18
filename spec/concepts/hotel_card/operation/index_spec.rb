require 'rails_helper'

describe HotelCard::Operation::Index do
  subject { described_class.() }
  let(:params) { { title: 'Hotel', address: 'Address' }}

  before do
    Hotel::Operation::Create.(params: params)
  end

  it 'result is of Result class' do
    is_expected.to be_instance_of Trailblazer::Operation::Railway::Result
  end

  it 'result should contain all Hotel records' do
    expect(subject[:model].first).to be_instance_of ::Hotel
    expect(subject[:model].length).to eq ::Hotel.count
  end
end

