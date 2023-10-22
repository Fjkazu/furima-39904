FactoryBot.define do
  factory :item do
    item_name              { 'いじめっこ' }
    overview                 { Faker::Internet.email }
    category_id              { 'test1234' }
    condition_id { password }
    delivery_id             { 'ごうだ' }
    prefecture_id            { 'たけし' }
    how_many_day_id         { 'ゴウダ' }
    price        { 'タケシ' }
    image                 { Faker::Lorem.sentence }
    association :user
  end
end
