FactoryBot.define do
  factory :item do
    name              {'善逸の刀'}
    description       {'本物です。プレミアが付く前にどうぞ'}
    price             {'112800'}
    condition_id      {3}
    cost_id           {2}
    scheduled_day_id  {2}
    prefecture_id     {2}
    category_id       {3}
    association :user

    after(:build) do |item_image|
        item_image.image.attach(io: File.open('public/test_images/a.jpg'), filename: 'a.jpg')
    end

  end
end