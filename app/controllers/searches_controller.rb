class SearchesController < ApplicationController
  def index
    if params[:word].present?
      @users = User.where("name LIKE ?", "%#{params[:word]}%")
      @beans = Bean.where("bean_name LIKE ?", "%#{params[:word]}%")
      @stores = Store.where("store_name LIKE ?", "%#{params[:word]}%")
    end
  end

end
