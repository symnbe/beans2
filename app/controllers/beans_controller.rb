class BeansController < ApplicationController

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new(bean_params)
    if @bean.save
      redirect_to beans_path
    else
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
    params.require(:bean).permit(:bean_name, :degree_of_roasting, :production_area, :store_name, :bean_image, :opinion).merge(user_id: current_user.id)
  end


end
