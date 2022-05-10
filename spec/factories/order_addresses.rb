FactoryBot.define do
  factory :order_address do
    postal_code { '123-1234' }
    item_prefecture_id{ '2' }
    city { '横浜市' }
    addresses { '青山1-1-1' }
    building { '東京ハイツ' }
    phone_number { '09012341234' }
  end
end
