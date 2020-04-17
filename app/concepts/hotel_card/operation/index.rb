class HotelCard::Operation::Index < Trailblazer::Operation
  step :model!

  def model!(ctx, *)
    ctx[:model] = ::Hotel.all
  end
end
