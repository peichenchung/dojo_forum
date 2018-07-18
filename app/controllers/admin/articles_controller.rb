class Admin::ArticlesController < Admin::BaseController
  before_action :authenticate_user!

  def index

  end
end
