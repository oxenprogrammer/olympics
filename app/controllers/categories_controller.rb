class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.category(params[:id]).order_by_most_recent
    @first = @articles[0]
    @second = @articles[1]
    @third = @articles[2]
    @fourth = @articles[3]
    @user = User.all
  end
end
