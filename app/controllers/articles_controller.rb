class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.page(params[:page]).per(20)
    @categories = Category.all
  end
end
