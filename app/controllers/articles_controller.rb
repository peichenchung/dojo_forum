class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.page(params[:page]).per(20)
    @categories = Category.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      flash[:notice] = "article created"
      redirect_to articles_path
    else
      flash.now[:alert] = "article failed to create"
      render :new
    end
  end

  def show
    #@article = Article.find(params[:id])
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "updated successfully"
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "failed to update"
      render :edit
    end
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :status)
  end
end
