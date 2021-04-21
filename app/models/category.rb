class Category < ApplicationRecord
  has_many :articles
  enum name: %i[athletics soccer board_games swimming]

  validates :name, presence: true

  after_initialize :init

  def init
    self.priority ||= Category.maximum('priority').nil? ? 1 : Category.maximum('priority') + 1
  end

  def self.prioritize(votes_by_category)
    categories = votes_by_category.keys
    categories.each_with_index do |category, i|
      find(category).update(priority: i + 1)
    end
    all
  end
end
