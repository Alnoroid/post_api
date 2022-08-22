FactoryBot.define do
  factory :low_rating do
    association :user, factory: :user
    association :post, factory: :post
    value 1
  end
  factory :high_rating do
    association :user, factory: :user
    association :post, factory: :post
    value 5
  end
end