class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_presence_of :user, :article
  validate :vote_is_unique, on: :create

  def vote_is_unique
    vote = Vote.where(article_id: self[:article_id], user_id: self[:user_id])
    errors.add(:vote_is_unique, 'you can only vote once') unless vote.empty?
  end

  def self.count_by_article
    group(:article_id).order('count_all desc').count
  end

  def self.count_by_category
    joins('INNER JOIN articles ON articles.id = votes.article_id')
      .joins('INNER JOIN categories ON categories.id=articles.category_id')
      .group(:category_id).order('count_all desc').count
  end

  def self.voted?(user, article)
    Vote.where(user_id: user.id, article_id: article.id).empty? ? false : true
  end

  def self.vote_count(article)
    votes = Vote.where(article_id: article.id).count
    concat content_tag(:p, votes, class: 'vote-count')
  end
end
