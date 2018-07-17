class RemoveArticleAndCategoryFromArticleCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :article_categories, :article
    remove_column :article_categories, :category
  end
end
