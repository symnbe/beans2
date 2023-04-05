class BeansController < ApplicationController
  
  def new
    @bean = Bean.new
  end
  
  def create
    bean = Bean.new(bean_params)
    bean.save
    redirect_to beans
  end
  
  def index
    @beans = Bean.all
  end

  def show
    @bean = Bean.find(params[:id])
  end

  def edit
  end
  
  
end
