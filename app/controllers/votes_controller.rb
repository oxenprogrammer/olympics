class VotesController < ApplicationController
  before_action :require_login, only: %i[new create]

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.build(vote_params)
    @article = Article.find(vote_params[:article_id])
    @category = Category.find(@article.category_id)

    if @vote.save
      redirect_to category_path(@category.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def vote_params
    params.permit(:article_id, :user_id)
  end

  def require_login
    return unless current_user.nil?

    flash[:alert] = 'Please login to Vote'
    redirect_to login_path
  end

  private :vote_params
end
