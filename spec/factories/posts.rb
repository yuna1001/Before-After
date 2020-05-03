FactoryBot.define do
  factory :post do
    body { Faker::Lorem.characters(number:5) }
    before_image_id { Faker::Lorem.characters(number:20) }
    after_image_id { Faker::Lorem.characters(number:20) }
    user
  end
end