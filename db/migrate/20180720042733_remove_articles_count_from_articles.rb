class RemoveArticlesCountFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :articles_count
  end
end
