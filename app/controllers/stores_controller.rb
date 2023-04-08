class StoresController < ApplicationController
  
  def create
    @store = Store.new(store_params)
    @store.save
    redirect_to beans_path
  end
  
  def index
  end

  def show
  end
end
