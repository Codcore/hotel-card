class HotelCardsController < ApplicationController
  def index
    run HotelCard::Operation::Index
  end
end
