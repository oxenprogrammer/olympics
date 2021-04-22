FactoryBot.define do
  factory :vote do
    user_id { rand(1..4) }
    article_id { rand(1..16) }
  end
end
