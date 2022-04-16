FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.sentence }
    info                        { Faker::Lorem.sentence }
    category_id                 { 1 }
    sales_status_id                { 1 }
    fee_status_id                  { 1 }
    prefecture_id                  { 1 }
    delivery_schedule_id           { 1 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
