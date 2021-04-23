# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# require 'database_cleaner'

# DatabaseCleaner.clean_with(:truncation)

User.destroy_all
100.times do
  User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: '123456', password_confirmation: '123456')
end

p 'Users created Successfully'

Category.destroy_all
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

Article.destroy_all
4.times do
  Article.create!([{
                    title: Faker::Lorem.sentence(word_count: 3),
                    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                    image: 'https://resources.stuff.co.nz/content/dam/images/1/s/f/6/b/3/image.related.StuffLandscapeSixteenByNine.1420x800.1sf63j.png/1540827339517.jpg',
                    author_id: rand(1..4),
                    category_id: 1
                  },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://www.ivacy.com/blog/wp-content/uploads/2016/08/watch-soccer-olympics.jpg',
                     author_id: rand(1..4),
                     category_id: 2
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://www1.pictures.zimbio.com/gi/Swimming+15th+FINA+World+Championships+Day+iNq3C_4oNJ_x.jpg',
                     author_id: rand(1..4),
                     category_id: 3
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'http://www.athleticsweekly.com/wp-content/uploads/2017/08/IAAF-World-Championships-London-2017-who-what-when.jpg',
                     author_id: rand(1..4),
                     category_id: 4
                   }])
end

p 'Articles created successfully'

Vote.destroy_all
100.times do |index|
  Vote.create!({
                 user_id: index + 1,
                 article_id: rand(1..16)
               })
end

p 'Random Votes created successfully'

