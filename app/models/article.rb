class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :title, :category_ids
  belongs_to :user #每篇文章屬於特定的使用者
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy #每篇文章有很多評論
  has_many :comment_user, through: :comments #每篇文章有很多評論的使用者
end
