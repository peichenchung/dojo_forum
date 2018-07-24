class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category

  validates_uniqueness_of :category_id, scope: :article_id
end
