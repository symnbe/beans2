class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image

        has_many :beans, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :comments, dependent: :destroy
        has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
        has_many :followings, through: :relationships, source: :followed
        has_many :followers, through: :reverse_of_relationships, source: :follower


         validates:name, presence:true
# 以下active storageで使用するメソッドを記載
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_profile.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image_profile.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
# 以下投稿数をカウントするメソッドを記載
  def bean_count
    beans.count
  end
# 以下フォロー機能で使用するメソッドを記載
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollowed(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  # 以下アカウントの公開非公開設定を行う際に使用するenumを記載
  enum status:{nonreleased: 0, released: 1}
  
end
