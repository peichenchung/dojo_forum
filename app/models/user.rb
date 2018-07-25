class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy

  has_many :comments, dependent: :destroy #使用者有很多評論
  has_many :commented_articles, through: :comments, source: :article #使用者有很多評論過的文章

  has_many :collects, dependent: :destroy
  has_many :collected_articles, through: :collects, source: :article

  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
end
