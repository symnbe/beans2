class BeansController < ApplicationController

  def new
    @bean = Bean.new
    @stores = Store.all
    @stores_json = @stores.map do |store|
      {
        store_id: store.id,
        store_name: store.store_name,
        latitude: store.latitude,
        longitude: store.longitude
      }.to_json
    end
    @production_areas = ProductionArea.all
  end

  def create
    @store = Store.new(store_params)
    @bean = current_user.beans.build(bean_params)
    if !@bean.store_id.present? && @store.valid? && @bean.valid?
      @store.save!
      @bean.store_id = @store.id
      @bean.save!
      redirect_to beans_path
    elsif @bean.store_id.present? && @bean.valid?
      @bean.save!
      redirect_to beans_path
    else
    @stores = Store.all
    @stores_json = @stores.map do |store|
      {
        store_id: store.id,
        store_name: store.store_name,
        latitude: store.latitude,
        longitude: store.longitude
      }.to_json
    end
    @production_areas = ProductionArea.all      
      render :new
    end
  end

  def index
    @beans = Bean.all
  end

  def show
    @bean = Bean.find(params[:id])
  end

  def edit
    @bean = Bean.find(params[:id])
  end

  def update
    @bean = Bean.find(params[:id])
    if @bean.update(bean_params)
      redirect_to beans_path
    else
      render :edit
    end
  end

  def destroy
    @bean = Bean.find(params[:id])
    if @bean.destroy
      redirect_to beans_path
    else
      render :show
    end
  end

  private

  def bean_params
    params.require(:bean).permit(:bean_name, :degree_of_roasting, :production_area_id, :store_id, :bean_image, :opinion)
  end
  
  def store_params
    params.require(:bean).permit(:store_name, :website, :phone_number, :opening_hours, :closing_hours, :address)
  end
end
