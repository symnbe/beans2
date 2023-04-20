class SearchesController < ApplicationController
  def index
    if params[:word].present?
      if current_user.admin?
        @users = User.released
      else
        @users = User.released.where.not(id: current_user.id)
      end
      @users = @users.where("name LIKE ?", "%#{params[:word]}%")
      @beans = Bean.where("bean_name LIKE ?", "%#{params[:word]}%")
      @stores = Store.where("store_name LIKE ?", "%#{params[:word]}%")
    end
  end


end

