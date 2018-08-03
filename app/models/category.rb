class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name #確定新增的分類不會有重複的
  has_many :article_categories, dependent: :restrict_with_error #有關聯物件時不能刪除
  has_many :articles, through: :article_categories, dependent: :restrict_with_error #有關聯物件時不能刪除
end
