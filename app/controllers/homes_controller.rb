class HomesController < ApplicationController
  def top
    
    @beans = Bean.order(created_at: :desc).limit(4)
    
  end
end
