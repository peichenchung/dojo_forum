class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "user role updated"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
