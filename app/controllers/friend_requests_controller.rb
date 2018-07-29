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
end
