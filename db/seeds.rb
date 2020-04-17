Hotel.destroy_all
result = Hotel::Operation::Create.(params: { title: 'Test Hotel', address: 'Test address' } )
result[:model].image.attach(io: File.open(Rails.root.join('db', 'seeds', 'img', 'hotel.jpg')),
                   filename: 'hotel.jpeg',
                   content_type: 'image/jpeg')
