class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @articles = @category.articles.page(params[:page]).per(20)
  end

  def replies_count
    @categories = Category.all
    @category = Category.find(params[:id])
    @articles = @category.articles.order(replies_count: :desc).page(params[:page]).per(20)
  end
end
