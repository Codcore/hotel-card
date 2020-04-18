Hotel.destroy_all

result = Hotel::Operation::Create.(params:
  { title: 'Sura Design Hotel & Suites',
    address: ' Divan Yolu Cad. Ticarethane Sok. No 43 Sultanahmet, Fatih, 34110 Istanbul, Turkey',
    rating: 4,
    tags: ['Featured', 'Free Parking'] })
