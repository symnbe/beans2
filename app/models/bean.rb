class Bean < ApplicationRecord

  has_one_attached :bean_image

  belongs_to :user
  belongs_to :store, optional: true
  belongs_to :production_area
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :opinion, presence: true

  enum degree_of_roasting: { light_roast: 0, cinnamon_roast: 1, medium_roast: 2, high_roast: 3, city_roast: 4, fullcity_roast: 5, french_roast: 6, italian_roast: 7}

  def get_bean_image# [width, height]
    unless bean_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_bean_bunsplash.jpg')
      bean_image.attach(io: File.open(file_path), filename: 'no_image_unsplash.jpg', content_type: 'image/jpeg')
    end
    # bean_image.variant(resize_to_limit:[width, height]).processed
      bean_image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
