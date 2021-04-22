module CategoriesHelper
  def vote_button(user, article)
    return unless logged_in?

    concat button_to 'Vote!', article_votes_path(article[:id]),
                     params: { vote: { user_id: current_user.id, article_id: article.id } },
                     disabled: voted?(user, article), class: 'vote-btn'
  end

  def voted?(user, article)
    Vote.where(user_id: user.id, article_id: article.id).empty? ? false : true
  end

  def vote_count(article)
    votes = Vote.where(article_id: article.id).count
    concat content_tag(:p, votes, class: 'vote-count')
  end
end
