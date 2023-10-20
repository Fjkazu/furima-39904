FactoryBot.define do
  factory :user do
    nickname              {"ジャイアン"}
    email                 {Faker::Internet.email}
    password              {"test1234"}
    password_confirmation {password}
    last_name             {"ごうだ"}
    first_name            {"たけし"}
    kanalast_name         {"ゴウダ"}
    kanafirst_name        {"タケシ"}
    birthdate             {Faker::Date.birthday}
  end
end