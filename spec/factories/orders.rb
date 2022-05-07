FactoryBot.define do
  factory :order do
    postal_code { "111-2222" }
    prefecture_id { "10" }
    city {"東京都千代田区"}
    addresses {"東京駅"}
    building {"丸の内"}
    phone_number { "03123456789" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
