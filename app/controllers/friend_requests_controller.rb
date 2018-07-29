class FriendRequestsController < ApplicationController
  def create #送出好友請求
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)

    if @friend_request.save #搭配唯一性驗證
      flash[:notice] = "You just sent a friend request"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "You already sent a friend request before!"
      redirect_back(fallback_location: root_path)
    end
  end

  def update #接受交友請求
    #在friendships table新增雙方的friendships記錄
    current_user.friendships.create!(friend_id: params[:friend_id])
    current_user.inverse_friendships.create!(user_id: params[:friend_id])

    #刪除(收到的)交友請求記錄
    @friend_request = current_user.inverse_friend_requests.where(friend_id: params[:id]).first
    @friend_request.destroy

    flash[:notice] = "You just accepted a friend request"
    redirect_back(fallback_location: root_path)
  end
end
