class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :my_draft, :my_comment, :my_collect, :my_friend]

  def show
    #@user = User.find(params[:id])
  end

  def edit
    #@user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    #@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def my_draft
    #@user = User.find(params[:id])
  end

  def my_comment
    #@user = User.find(params[:id])
  end

  def my_collect
    #@user = User.find(params[:id])
  end

  def my_friend
    #@user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
end
