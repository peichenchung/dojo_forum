class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.page(params[:page]).per(20)
    @categories = Category.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "article created"
      redirect_to articles_path
    else
      flash.now[:alert] = "article failed to create"
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :status)
  end
end
