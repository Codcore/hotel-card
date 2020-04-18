class HotelCardsController < ApplicationController
  def index
    result = run HotelCard::Operation::Index
    render html: cell(HotelCard::Cell::Index, result[:model], layout: Application::Cell::Layout)
  end
end
