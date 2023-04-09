class StoresController < ApplicationController
  
  # def create
  #   @store = Store.new(store_params)
  #   @store.save
  #   redirect_to beans_path
  # end
  
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end
end
