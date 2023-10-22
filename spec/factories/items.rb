FactoryBot.define do
  factory :item do
    item_name                { 'いじめっこ' }
    overview                 { 'ジャイアンのことさ' }
    category_id              { "2" }
    condition_id             { "3" }
    delivery_cost_id         { "2" }
    prefecture_id            { "2" }
    how_many_day_id          { "2" }
    price                    { 500 }


    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/akichi.png'), filename: 'akichi.png')
    end
  end
end
