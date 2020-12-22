FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name {Gimei.last.kanji}
    first_name {Gimei.last.kanji}
    last_kana {Gimei.last.katakana}
    first_kana {Gimei.first.katakana}
    password {Faker::Internet.password(min_length: 6, max_length: 20)}
    # password {password}省略した
    password_confirmation {password}
    birth {Faker::Date.between(from: 20.days.ago, to: Date.today)}
    email {Faker::Internet.free_email}
  end
end
