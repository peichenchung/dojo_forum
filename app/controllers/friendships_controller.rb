class FriendshipsController < ApplicationController
  def destroy #刪除好友
    @friendship = current_user.friendships.where(friend_id: params[:friend_id]).first
    @inverse_friendship = current_user.inverse_friendships.where(friend_id: current_user).first

    @friendship.destroy
    @inverse_friendship.destroy

    flash[:alert] = "Unfriend successfully!"
    redirect_back(fallback_location: root_path)
  end
end
