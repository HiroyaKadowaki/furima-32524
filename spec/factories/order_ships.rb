FactoryBot.define do
  factory :order_ship do
    zip { "000-0000"}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    phone_number {Faker::Number.number(digits: 11)}
    province_id {Faker::Number.within(range: 2..48)}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
