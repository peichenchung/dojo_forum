class Category < ApplicationRecord
  validates_presence_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories, dependent: :restrict_with_error #有關聯物件時不能刪除
end
