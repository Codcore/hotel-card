class HotelCard::Cell::Show < Trailblazer::Cell
  def show
    render
  end

  def badge_class_for_tag(tag)
    case tag.name
    when 'Featured' then 'badge-danger'
    else 'badge-success'
    end
  end

  def max_rating
    ::Hotel::MAX_RATING
  end

  def active_rating_color
    '#f1ae4e'
  end

  def inactive_rating_color
    '#c4c4c4'
  end
end
