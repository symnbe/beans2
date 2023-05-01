class FavoritesController < ApplicationController

  def show
  @favorited_users = User.includes(:favorites).where(favorites: { bean_id: params[:id] })
  end

  def create
    bean = Bean.find(params[:bean_id])
    favorite = current_user.favorites.new(bean_id: bean.id)
    favorite.save
    redirect_to bean_path(bean)
  end

  def destroy
    bean = Bean.find(params[:bean_id])
    favorite = current_user.favorites.find_by(bean_id: bean.id)
    favorite.destroy
    redirect_to bean_path(bean)
  end

end
