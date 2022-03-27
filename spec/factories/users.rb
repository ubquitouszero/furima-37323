FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name              {Faker::Person.initials(number: 2)}
    first_name             {Faker::Name.initials(number: 2)}
    last_name_kana              {Faker::Name.initials(number: 2)}
    first_name_kana              {Faker::Name.initials(number: 2)}
    birth_date              {Faker::Date.birthday(min_age: 5, max_age: 95)}

  end
end