FactoryBot.define do
  factory :article do
    title { "MyString" }
    text { "MyText" }
    image { "MyString" }
    user { nil }
    category { nil }
  end
end
