class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :text, presence: true, length: { minimum: 50, maximum: 3000 }
  validates :author_id, presence: true
  validates :category_id, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg|webp)/, message: 'must be a URL for Webp, GIF, JPG or PNG image.' }

  scope :order_by_most_recent, -> { order(created_at: :desc) }
  scope :category, ->(category_id) { where(category_id: category_id) }

  def self.most_popular(votes_by_article)
    find(votes_by_article.keys[0])
  end

  def self.last_by_category(categories, index)
    where(category_id: categories[index]).order(created_at: :desc).first
  end
end
