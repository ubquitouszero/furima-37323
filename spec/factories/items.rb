FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.sentence }
    info                        { Faker::Lorem.sentence }
    category                 { Category.all.sample }
    sales_status             { SalesStatus.all.sample }
    fee_status               { FeeStatus.all.sample }
    prefecture               { Prefecture.all.sample }
    delivery_schedule        { DeliverySchedule.all.sample }
    price                       { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end