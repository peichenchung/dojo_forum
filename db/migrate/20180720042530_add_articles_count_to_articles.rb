class AddArticlesCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :articles_count, :integer, default: 0
  end
end
