class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
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
