require 'rails_helper'

describe Hotel::Operation::Create do
  let(:params) { { title: 'Title', address: 'Address' } }
  subject { described_class.(params: params) }

  it 'result is of Result class' do
    is_expected.to be_instance_of Trailblazer::Operation::Railway::Result
  end

  it 'result should contain Hotel record' do
    expect(subject[:model]).to be_instance_of ::Hotel
  end

  it 'should create an Hotel record' do
    expect { subject }.to change(::Hotel, :count).by(1)
  end
end
