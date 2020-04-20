require 'rails_helper'

describe Hotel::Operation::Create do
  let(:tags) { [ 'Test tag 1', 'Test tag 2' ] }
  let(:params) { { title: 'Title', address: 'Address', tags: tags } }
  subject { described_class.(params: params) }

  it 'result is of Result class' do
    is_expected.to be_instance_of Trailblazer::Operation::Railway::Result
  end

  it 'result contains Hotel record' do
    expect(subject[:model]).to be_instance_of ::Hotel
  end

  it 'creates an Hotel record' do
    expect { subject }.to change(::Hotel, :count).by(1)
  end

  it 'assigns tags to Hotel record' do
    expect(subject[:model].tag_list).to eq tags
  end

  it 'assigns default image to Hotel record' do
    expect(subject[:model].image.filename.to_s).to eq 'hotel.jpeg'
  end
end
