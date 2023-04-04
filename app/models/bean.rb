class Bean < ApplicationRecord

  has_one_attached :bean_image

  belongs_to :user
  
  validates:store_name, presence:true
  validates:opinion, presence:true

end
