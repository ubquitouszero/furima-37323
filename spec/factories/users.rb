FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    last_name              {Faker::Person.last.kanji}
    first_name             {Faker::Person.first.kanji}
    last_name_kana              {Faker::Name.Person.last.katakana}
    first_name_kana              {Faker::Name.Person.first.katakana}
    birth_date              {Faker::Date.birthday(min_age: 5, max_age: 95)}

  end
end