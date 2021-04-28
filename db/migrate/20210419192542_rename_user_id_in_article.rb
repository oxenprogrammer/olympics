class RenameUserIdInArticle < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :user_id, :author_id
  end
end
