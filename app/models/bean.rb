class Bean < ApplicationRecord

  has_one_attached :bean_image

  belongs_to :user
  
  validates:store_name, presence:true
  validates:opinion, presence:true
  
  enum production_area: { brazil: 0, vietnam: 1, columbia: 2, indonesia: 3, ethiopia: 4, honduras: 5, india: 6, peru: 7, guatemala: 8, uganda: 9 }
  enum degree_of_roasting: { light_roast: 0, cinnamon_roast: 1, medium_roast: 2, high_roast: 3, city_roast: 4, fullcity_roast: 5, french_roast: 6, italian_roast: 7}

end
