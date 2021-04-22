class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @votes_by_article = Vote.count_by_article
    @votes_by_category = Vote.count_by_category
    @all_categories = Category.all
    @categories = Category.prioritize(@votes_by_category).ids
    @featured = Article.most_popular(@votes_by_article)
    @first = Article.last_by_category(@categories, 0)
    @second = Article.last_by_category(@categories, 1)
    @third = Article.last_by_category(@categories, 2)
    @fourth = Article.last_by_category(@categories, 3)
  end

  def new
    @article = Article.new
    @category_options = Category.all.map { |c| [c.name.titleize, c.id] }
  end

  def show; end
end
