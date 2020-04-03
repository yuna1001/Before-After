class Post < ApplicationRecord
  belongs_to :user

  attachment :before_image
  attachment :after_image

  validates :body, presence: true

end
