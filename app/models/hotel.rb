class Hotel < ApplicationRecord
  MAX_RATING = 5
  has_one_attached :image

  acts_as_taggable
end
