FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }
    name { Faker::Lorem.characters(number: 5) }
    profile { Faker::Lorem.characters(number: 100) }
  end
end
