module CategoriesHelper
  def vote(current_user, article)
    return unless logged_in?

    link_to 'Vote', article_votes_path(article[:id]),
            params: { vote: { user_id: current_user.id, article_id: article.id } },
            disabled: voted?(current_user, article), method: :post
  end

  def voted?(user, article)
    Vote.where(user_id: user.id, article_id: article.id).empty? ? false : true
  end

  def vote_count(article)
    Vote.where(article_id: article.id).count
  end

  private :voted?
end
