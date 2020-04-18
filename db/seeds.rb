Hotel.destroy_all

result = Hotel::Operation::Create.(params:
  { title: 'Sura Design Hotel & Suites',
    address: 'Test address',
    rating: 4 })

hotel_img_path = Rails.root.join('db', 'seeds', 'img', 'hotel.jpg')
result[:model].image.attach(io: File.open(hotel_img_path), filename: 'hotel.jpeg', content_type: 'image/jpeg')
result[:model].tag_list.add('Featured', 'Free Parking')
result[:model].save!
