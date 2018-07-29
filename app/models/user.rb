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

  has_many :friendships, dependent: :destroy #一個user擁有很多friendship記錄
  has_many :friends, through: :friendships #透過friendship記錄,使用者擁有很多好友(user)

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  validates_presence_of :name #註冊時必填
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
end
