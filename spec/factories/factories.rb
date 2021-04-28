require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :author, class: 'User' do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :article do
    title { 'Hello Friends' }
    text { 'This is really beginning to really nag me, why is it not really working, man can you save me' }
    image { 'https://www1.pictures.zimbio.com/gi/Swimming+15th+FINA+World+Championships+Day+iNq3C_4oNJ_x.jpg' }
    author_id { rand(1..4) }
    category_id { rand(1..4) }
  end

  factory :category do
    name { Faker::Lorem.characters(number: 10) }
    priority { 1 }
  end

  factory :vote do
    user_id { rand(1..4) }
    article_id { rand(1..16) }
  end
end
