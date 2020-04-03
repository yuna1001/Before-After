class Post < ApplicationRecord
  belongs_to :user
  has_one :after_image, dependent: :destroy
  has_one :before_image, dependent: :destroy

  validates :body, presence: true

end
