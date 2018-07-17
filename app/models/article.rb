class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :title
  has_and_belongs_to_many :categories
end
