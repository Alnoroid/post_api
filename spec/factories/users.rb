FactoryBot.define do
  factory :user do
    login { Faker::Internet.username }
    trait :with_post do
      after(:create) do |user|
        create(:post, user_id: user.id)
      end
    end
  end
end
