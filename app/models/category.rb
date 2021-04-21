class Category < ApplicationRecord
  has_many :articles
  enum name: %i[athletics soccer board_games swimming]
end
