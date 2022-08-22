FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }
    ip    { Faker::Internet.ip_v4_address }
    trait :with_post do
      after(:create) do |user|
        create(:post, user_id: user.id)
      end
    end
  end
end