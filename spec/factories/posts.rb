FactoryBot.define do
  factory :post do
    association :user
    author { Faker::Lorem.characters(number: 10) }
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 100) }
    star { Faker::Number.between(from: 1, to: 5) }
  end
end
