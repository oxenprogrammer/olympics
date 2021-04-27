class User < ApplicationRecord
  has_many :articles, dependent: :destroy, foreign_key: 'author_id'
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :voted_articles, through: :votes, source: :article
  has_secure_password
end
