class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category created"
      redirect_to admin_root_path
    else
      flash[:alert] = "category failed to create"
      redirect_to admin_root_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
