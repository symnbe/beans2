class SearchesController < ApplicationController
  def index
   
    @users = User.where("name LIKE ?", "%#{params[:user_query]}%")
    @beans = Bean.where("name LIKE ?", "%#{params[:bean_query]}%")
    @stores = Store.where("name LIKE ?", "%#{params[:store_query]}%")
  end
    
end
