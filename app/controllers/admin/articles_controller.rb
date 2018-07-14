class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin #自定義的方法，寫在ApplicationController中

  def index
    @categories = Category.all
  end
end
