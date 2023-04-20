class RelationshipsController < ApplicationController
   def create
    user = User.find(params[:user_id])
    unless user.released? && (current_user.admin? || current_user == user)
      current_user.follow(user)
    end
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    unless user.released? && (current_user.admin? || current_user == user)
      current_user.unfollow(user)
    end
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings.released
    @users = @users.where.not(id: current_user.id) unless current_user.admin?
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers.released
    @users = @users.where.not(id: current_user.id) unless current_user.admin?
  end

end

