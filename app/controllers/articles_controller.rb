class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :collect, :uncollect]

  def index
    @articles = Article.page(params[:page]).per(20)
    @categories = Category.all
  end

  def replies_count
    @articles = Article.order(replies_count: :desc).page(params[:page]).per(20)
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
    @comment = Comment.new
    @comments = @article.comments.page(params[:page]).per(20)
  end

  def edit
    #@article = Article.find(params[:id])
    if current_user.id != @article.user_id
      redirect_to root_path
      flash[:alert] = "Not allow!!"
    end
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

  def destroy
    #@article = Article.find(params[:id])

    if current_user.id == @article.user_id
      @article.destroy
      redirect_to root_path
      flash[:alert] = "article deleted"
    end
  end

  def collect
    #@article = Article.find(params[:id])
    if @article.is_collected?(current_user)
      flash[:alert] = "already in your collect list"
    else
      @article.collects.create!(user: current_user)
    end
    redirect_back(fallback_location: root_path)
  end

  def uncollect
    #@article = Article.find(params[:id])
    collects = Collect.where(article: @article, user: current_user)
    collects.destroy_all
    redirect_back(fallback_location: root_path)
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :status, category_ids:[])
  end
end
