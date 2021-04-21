# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

100.times do
  User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: '123456', password_confirmation: '123456')
end

p 'Users created Successfully'

Category.create!([{
                   name: 'athletics'
                 },
                  {
                    name: 'soccer'
                  },
                  {
                    name: 'board_games'
                  },
                  {
                    name: 'swimming'
                  }])

p 'Categories created successfully'

4.times do
  Article.create!([{
                    title: Faker::Lorem.sentence(word_count: 3),
                    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                    image: 'https://images.freeimages.com/images/large-previews/eb7/mountain-1379228.jpg',
                    author_id: rand(1..4),
                    category_id: 1
                  },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://images.freeimages.com/images/large-previews/fee/days-end-1392672.jpg',
                     author_id: rand(1..4),
                     category_id: 2
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://images.freeimages.com/images/large-previews/940/ostrich-masai-mara-kenya-1365799.jpg',
                     author_id: rand(1..4),
                     category_id: 3
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://images.freeimages.com/images/large-previews/600/bike-path-1438265.jpg',
                     author_id: rand(1..4),
                     category_id: 4
                   }])
end

p 'Articles created successfully'

100.times do |index|
  Vote.create!({
                 user_id: index + 1,
                 article_id: rand(1..16)
               })
end

p 'Random Votes created successfully'

