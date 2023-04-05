Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  resources:beans, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  
  
end
