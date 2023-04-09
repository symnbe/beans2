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

  private

  def store_params
    params.require(:website, :phone_number, :opening_hours, :closing_hours)
  end

end
