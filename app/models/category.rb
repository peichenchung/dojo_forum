class Category < ApplicationRecord
  validates_presence_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories
end
