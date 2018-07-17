class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :title
  has_many :article_categories
  has_many :categories, through: :article_categories
end
