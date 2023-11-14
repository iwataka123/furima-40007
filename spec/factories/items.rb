FactoryBot.define do
  factory :item do
    name               {Faker::Movie.title}
    explanation        {Faker::Lorem.sentence}
    category_id        {'11'}
    status_id          {'2'}
    delivery_charge_id {'2'}
    prefecture_id      {'24'}
    shipping_date_id   {'2'}
    price              {'12000'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
