class Post < ApplicationRecord
  belongs_to :user

  attachment :before_image
  attachment :after_image

  validates :body, presence: true
  validates :before_image, presence: true
  validates :after_image, presence: true

end
