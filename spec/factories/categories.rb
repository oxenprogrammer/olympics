FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 7) }
    priority { 1 }
  end
end
