class AfterImage < ApplicationRecord
  belongs_to :post

  validates :after_postimage, presence: true

  attachment :after_postimage
end
