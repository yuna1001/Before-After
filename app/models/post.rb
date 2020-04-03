class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :before_image
  attachment :after_image

  validates :body, presence: true
  validates :before_image, presence: true
  validates :after_image, presence: true

end
