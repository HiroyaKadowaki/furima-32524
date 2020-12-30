FactoryBot.define do
  factory :item do
    name {Faker::Name.first_name}
    description {Faker::Name.first_name}
    price {Faker::Number.within(range: 300..9999999)}
    burden_id {Faker::Number.within(range: 2..3)}
    category_id {Faker::Number.within(range: 2..11)}
    province_id {Faker::Number.within(range: 2..48)}
    ship_day_id {Faker::Number.within(range: 2..4)}
    state_id {Faker::Number.within(range: 2..7)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'public/images/test_image.png')
    end
  end
end
