class CommentsController < ApplicationController
  before_action :require_login, only: %i[create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @article = Article.find(comment_params[:article_id])

    redirect_to article_path(@article.id) if @comment.save
  end

  def require_login
    return unless current_user.nil?

    flash[:alert] = 'Please login to Create an Article'
    redirect_to login_path
  end

  def comment_params
    params.permit(:article_id)
  end

  private :require_login, :comment_params
end
