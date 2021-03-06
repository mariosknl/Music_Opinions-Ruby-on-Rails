class FollowingsController < ApplicationController
  def create
    user = User.find(params[:id])
    current_user.follow(user)
    flash[:notice] = "You've successfully followed #{user.username}"
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    flash[:notice] = "You've successfully unfollowed #{user.username}"
    redirect_to opinions_path
  end
end
