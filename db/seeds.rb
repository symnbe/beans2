# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(email: "admin@test.com", password: "password")

areas = ["ブラジル",                                   
         "ベトナム",                                   
         "コロンビア",                                 
         "インドネシア",                               
         "エチオピア",                                 
         "ホンジュラス",                               
         "インド",
         "ペルー",
         "グァテマラ",
         "ウガンダ"]
         
areas.each do |area|
  ProductionArea.create!(area: area)
end

50.times do
  Store.create!(
      store_name: Faker::Name.name,
      website: "https://test.com",
      phone_number: Faker::Number.leading_zero_number(digits: 12),
      opening_hours: "#{rand(9..12)}:00",
      closing_hours: "#{rand(17..24)}:00",
      address: Faker::Address.full_address,
      latitude: rand(-90.0..90.0),
      longitude: rand(-180.0..180.0)
    )
end

(1..20).each do |n|
  user = User.create!(name: "user#{n}", email: "user#{n}@test.com", password: "password")
  5.times do
    user.beans.create!(
        bean_name: Faker::Tea.variety,
        opinion: Faker::Lorem.paragraph,
        degree_of_roasting: rand(0..7),
        price: rand(9..11) * 100,
        production_area_id: rand(1..ProductionArea.all.count),
        store_id: rand(1..Store.all.count)
      )
  end
end



