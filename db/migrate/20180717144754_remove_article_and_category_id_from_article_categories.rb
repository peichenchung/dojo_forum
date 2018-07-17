class RemoveArticleAndCategoryIdFromArticleCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :article_categories, :article_id
    remove_column :article_categories, :category_id
  end
end
