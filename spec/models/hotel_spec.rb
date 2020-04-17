require 'rails_helper'

RSpec.describe Hotel, type: :model do
  subject { Hotel::Operation::Create.present(Hotel.new) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
end
