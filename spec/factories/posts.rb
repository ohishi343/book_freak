FactoryBot.define do
  factory :post do
    author { "MyString" }
    title { "MyString" }
    body { "MyText" }
    star { 1 }
    profile { "MyProfile" }
  end
end
