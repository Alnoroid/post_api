FactoryBot.define do
  factory :rating do
    association :user, factory: :user
    association :post, factory: :post
    value 3
    trait :low_value do
      value { 1 }
    end

    trait :high_value do
      value { 5 }
    end
  end
end