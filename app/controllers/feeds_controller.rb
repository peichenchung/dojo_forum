class FeedsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.order(comments_count: :desc).limit(10)
    @articles = Article.order(replies_count: :desc).limit(10)
  end
end