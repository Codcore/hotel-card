require 'rails_helper'

feature 'User see hotel card', js: true do
  given(:tags) { ['Featured', 'Free Parking'] }
  given(:hotel_params) do
    { title: 'Test title',
      address: 'Test address',
      rating: 3,
      tags: tags }
  end
  given!(:hotel) { Hotel::Operation::Create.(params: hotel_params)[:model] }

  scenario 'User visits hotel cards page and sees hotel card' do
    visit root_path

    within 'div.hotel-card__badges' do
      tags.each do |tag|
        expect(page).to have_content(tag)
      end
    end

    within 'div.hotel-card__title' do
      expect(page).to have_content(hotel_params[:title])
    end

    within 'div.hotel-card__location' do
      expect(page).to have_content(hotel_params[:address])
    end

    within 'div.hotel-card__actions' do
      expect(page).to have_content('See availability')
    end

    within 'div.hotel-card__rating' do
      expect(page).to have_selector('svg.bi-star-fill').thrice
      expect(page).to have_selector('svg.bi-star').twice
    end

    within 'div.hotel-card__img-wrapper' do
      expect(find('img.hotel-card__img')[:src].split('/').last).to eq hotel.image.filename.to_s
    end

    within 'div.actions__price' do
      expect(page).to have_content('$XX.XX')
      expect(page).to have_content('CAD')
    end
  end
end
