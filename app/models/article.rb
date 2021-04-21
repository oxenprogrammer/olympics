class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :text, presence: true, length: { minimum: 50, maximum: 3000 }
  validates :author_id, presence: true
  validates :category_id, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg|webp)/, message: 'must be a URL for Webp, GIF, JPG or PNG image.' }
end
