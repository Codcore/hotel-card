class Hotel::Contract::Create < Reform::Form
  property :title
  property :address
  property :rating

  validates :title, :address, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }
end