module CategoriesHelper
  def voted?(user, article)
    Vote.where(user_id: user.id, article_id: article.id).empty? ? false : true
  end

  def vote_count(article)
    Vote.where(article_id: article.id).count
  end
end
