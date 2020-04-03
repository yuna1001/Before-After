class BeforeImage < ApplicationRecord
  belongs_to :post

  validates :before_postimage, presence: true

  attachment :before_postimage
end
