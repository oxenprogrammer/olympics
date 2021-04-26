class ArticlesController < ApplicationController
  before_action :require_login, only: %i[new create]

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

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_url @article.id
    else
      render :new
    end
  end

  def require_login
    return unless current_user.nil?

    flash[:alert] = 'Please login to Create an Article'
    redirect_to login_path
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end

  private :require_login, :article_params
end
