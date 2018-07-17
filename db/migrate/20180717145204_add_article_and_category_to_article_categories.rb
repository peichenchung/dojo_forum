class AddArticleAndCategoryToArticleCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :article_categories, :article, :belongs_to
    add_column :article_categories, :category, :belongs_to
  end
end
