FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body  { Faker::Lorem.paragraph }
    user  nil
    ip    { Faker::Internet.ip_v4_address }
  end
end
