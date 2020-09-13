FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    firstname {Gimei.first.kanji}
    lastname {Gimei.last.kanji}
    f_name_read {Gimei.first.katakana}
    l_name_read {Gimei.last.katakana}
    birthday {2000-01-01}
  end
end