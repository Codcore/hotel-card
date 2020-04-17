class Hotel < ApplicationRecord
  validates :title, :address, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 0 }

  has_one_attached :image
end
