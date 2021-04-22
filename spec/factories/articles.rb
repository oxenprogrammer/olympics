FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 2) }
    text { Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false) }
    image { 'https://www1.pictures.zimbio.com/gi/Swimming+15th+FINA+World+Championships+Day+iNq3C_4oNJ_x.jpg' }
    author_id { rand(1..4) }
    category_id { rand(1..4) }
  end
end
