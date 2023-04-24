class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:top, :index]
  before_action :require_admin, only: [:unpublish]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])

  # Google Mapを表示するためのJavaScriptを生成
    @map_options = {
      latitude: @store.latitude,
      longitude: @store.longitude
    }.to_json
  end

  def edit
  @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  private

  def store_params
    params.require(:store).permit(:website, :phone_number, :opening_hours, :closing_hours)
  end

end
