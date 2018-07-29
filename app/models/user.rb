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

  has_many :friend_requests, dependent: :destroy #一個user有很多(送出的)friend_request記錄
  has_many :pending_friends, through: :friend_requests, source: :friend
  #透過friend_request記錄,user擁有很多pending_friends(user主動加的好友)

  has_many :inverse_friend_requests, class_name: "FriendRequest", foreign_key: "friend_id"
  #一個user有很多(收到的)friend_request記錄
  has_many :inverse_pending_friends, through: :inverse_friend_requests, source: :user
  #透過inverse_friend_requests記錄,user擁有很多inverse_pending_friends(加user好友的人)

  validates_presence_of :name #註冊時必填
  
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
end
