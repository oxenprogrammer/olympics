require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :article do
    title { Faker::Lorem.sentence(word_count: 2) }
    text { Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false) }
    image { 'https://www1.pictures.zimbio.com/gi/Swimming+15th+FINA+World+Championships+Day+iNq3C_4oNJ_x.jpg' }
    author_id { rand(1..4) }
    category_id { rand(1..4) }
  end

  factory :category do
    name { Faker::Lorem.characters(number: 7) }
    priority { 1 }
  end

  factory :vote do
    user_id { rand(1..4) }
    article_id { rand(1..16) }
  end
end
